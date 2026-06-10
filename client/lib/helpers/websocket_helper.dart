import 'dart:async';

import 'package:web_socket_channel/web_socket_channel.dart';

enum WebSocketStatus { disconnected, connecting, connected, reconnecting }

class WebSocketHelper {
  final String url;
  final Duration reconnectDelay;
  final int maxReconnectAttempts; // 0 = unlimited

  WebSocketHelper({
    required this.url,
    this.reconnectDelay = const Duration(seconds: 3),
    this.maxReconnectAttempts = 0,
  });

  WebSocketChannel? _channel;
  Timer? _reconnectTimer;
  int _reconnectAttempts = 0;
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

  Future<void> connect() async {
    if (_disposed) return;
    if (_status == WebSocketStatus.connected ||
        _status == WebSocketStatus.connecting) {
      return;
    }

    _setStatus(WebSocketStatus.connecting);

    try {
      _channel = WebSocketChannel.connect(Uri.parse(url));
      await _channel!.ready;
      _reconnectAttempts = 0;
      _setStatus(WebSocketStatus.connected);

      _channel!.stream.listen(
        (data) => _messageController.add(data.toString()),
        onError: (_) => _scheduleReconnect(),
        onDone: () {
          if (!_disposed) _scheduleReconnect();
        },
        cancelOnError: true,
      );
    } catch (_) {
      _scheduleReconnect();
    }
  }

  void send(String message) {
    if (_status == WebSocketStatus.connected) {
      _channel?.sink.add(message);
    }
  }

  void _scheduleReconnect() {
    if (_disposed) return;
    if (maxReconnectAttempts > 0 &&
        _reconnectAttempts >= maxReconnectAttempts) {
      _setStatus(WebSocketStatus.disconnected);
      return;
    }

    _reconnectAttempts++;
    _setStatus(WebSocketStatus.reconnecting);
    _channel?.sink.close();
    _channel = null;

    final delay = Duration(
      seconds: (reconnectDelay.inSeconds * _reconnectAttempts).clamp(
        reconnectDelay.inSeconds,
        30,
      ),
    );

    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(delay, connect);
  }

  void disconnect() {
    _reconnectTimer?.cancel();
    _channel?.sink.close();
    _channel = null;
    _setStatus(WebSocketStatus.disconnected);
  }

  void dispose() {
    _disposed = true;
    disconnect();
    _messageController.close();
    _statusController.close();
  }
}
