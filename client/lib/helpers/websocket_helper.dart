import 'dart:async';

import 'package:web_socket_channel/web_socket_channel.dart';

enum WebSocketStatus { disconnected, connecting, connected, reconnecting }

class WebSocketHelper {
  final String url;

  /// Initial delay before the first reconnect attempt.
  final Duration initialReconnectDelay;

  /// Maximum delay between reconnect attempts (exponential backoff is capped here).
  final Duration maxReconnectDelay;

  /// If no message is received for this duration while "connected", the
  /// connection is considered stale and a reconnect is triggered.
  final Duration silenceTimeout;

  /// 0 = unlimited reconnect attempts.
  final int maxReconnectAttempts;

  WebSocketHelper({
    required this.url,
    this.initialReconnectDelay = const Duration(seconds: 1),
    this.maxReconnectDelay = const Duration(seconds: 10),
    this.silenceTimeout = const Duration(seconds: 30),
    this.maxReconnectAttempts = 0,
  });

  WebSocketChannel? _channel;
  Timer? _reconnectTimer;
  Timer? _watchdogTimer;
  DateTime _lastActivity = DateTime.now();
  int _reconnectAttempts = 0;

  // _active: we *want* to be connected (set true by connect(), false by disconnect())
  // _disposed: permanent teardown — no further connects allowed
  bool _active = false;
  bool _disposed = false;

  final _messageController = StreamController<String>.broadcast();
  final _statusController = StreamController<WebSocketStatus>.broadcast();

  Stream<String> get messages => _messageController.stream;
  Stream<WebSocketStatus> get status => _statusController.stream;

  WebSocketStatus _status = WebSocketStatus.disconnected;
  WebSocketStatus get currentStatus => _status;

  void _setStatus(WebSocketStatus s) {
    _status = s;
    _statusController.add(s);
  }

  // ─── Watchdog ─────────────────────────────────────────────────────────────
  // If we're connected but receive no messages for silenceTimeout, the
  // connection is silently dead. Restart it.

  void _startWatchdog() {
    _lastActivity = DateTime.now();
    _watchdogTimer?.cancel();
    _watchdogTimer = Timer.periodic(
      silenceTimeout ~/ 2, // check at half the timeout interval
      (_) => _checkAlive(),
    );
  }

  void _stopWatchdog() {
    _watchdogTimer?.cancel();
    _watchdogTimer = null;
  }

  void _checkAlive() {
    if (_disposed || !_active || _status != WebSocketStatus.connected) return;
    if (DateTime.now().difference(_lastActivity) >= silenceTimeout) {
      _scheduleReconnect();
    }
  }

  // ─── Public API ───────────────────────────────────────────────────────────

  Future<void> connect() async {
    if (_disposed) return;
    _active = true;

    if (_status == WebSocketStatus.connected ||
        _status == WebSocketStatus.connecting) {
      return;
    }

    _setStatus(WebSocketStatus.connecting);

    try {
      _channel = WebSocketChannel.connect(Uri.parse(url));
      await _channel!.ready.timeout(const Duration(seconds: 5));

      if (!_active || _disposed) {
        // Disconnected while we were waiting for the handshake.
        _channel?.sink.close();
        _channel = null;
        return;
      }

      _reconnectAttempts = 0;
      _setStatus(WebSocketStatus.connected);
      _startWatchdog();

      _channel!.stream.listen(
        (data) {
          _lastActivity = DateTime.now();
          if (!_messageController.isClosed) {
            _messageController.add(data.toString());
          }
        },
        onError: (_) {
          _stopWatchdog();
          if (!_disposed && _active) _scheduleReconnect();
        },
        onDone: () {
          _stopWatchdog();
          if (!_disposed && _active) _scheduleReconnect();
        },
        cancelOnError: true,
      );
    } catch (_) {
      _stopWatchdog();
      if (!_disposed && _active) _scheduleReconnect();
    }
  }

  /// Tear down the current connection and reconnect immediately (resets backoff).
  void reconnect() {
    if (_disposed) return;
    _reconnectAttempts = 0;
    _stopWatchdog();
    _reconnectTimer?.cancel();
    _channel?.sink.close();
    _channel = null;
    _active = true;
    _setStatus(WebSocketStatus.reconnecting);
    // Small delay to let the OS clean up the old socket before re-opening.
    _reconnectTimer = Timer(const Duration(milliseconds: 200), connect);
  }

  void send(String message) {
    if (_status == WebSocketStatus.connected) {
      _channel?.sink.add(message);
    }
  }

  /// Stop attempting to connect. Does NOT dispose — connect()/reconnect()
  /// can be called again later.
  void disconnect() {
    _active = false;
    _stopWatchdog();
    _reconnectTimer?.cancel();
    _channel?.sink.close();
    _channel = null;
    _setStatus(WebSocketStatus.disconnected);
  }

  /// Permanent teardown. The helper cannot be reused after this.
  void dispose() {
    _disposed = true;
    _active = false;
    _stopWatchdog();
    _reconnectTimer?.cancel();
    _channel?.sink.close();
    _channel = null;
    if (!_messageController.isClosed) _messageController.close();
    if (!_statusController.isClosed) _statusController.close();
  }

  // ─── Internals ────────────────────────────────────────────────────────────

  void _scheduleReconnect() {
    if (_disposed || !_active) return;
    if (maxReconnectAttempts > 0 &&
        _reconnectAttempts >= maxReconnectAttempts) {
      _active = false;
      _setStatus(WebSocketStatus.disconnected);
      return;
    }

    _reconnectAttempts++;
    _setStatus(WebSocketStatus.reconnecting);
    _channel?.sink.close();
    _channel = null;

    // Exponential backoff: 1s → 2s → 4s → 8s → 10s (capped)
    final delayMs = (initialReconnectDelay.inMilliseconds *
            (1 << (_reconnectAttempts - 1).clamp(0, 6)))
        .clamp(
          initialReconnectDelay.inMilliseconds,
          maxReconnectDelay.inMilliseconds,
        );

    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(Duration(milliseconds: delayMs), connect);
  }
}
