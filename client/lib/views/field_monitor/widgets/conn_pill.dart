import 'package:flutter/material.dart';

// ─── Status enum ─────────────────────────────────────────────────────────────

enum ConnStatus { ok, degraded, error, none }

extension ConnStatusStyle on ConnStatus {
  Color get dot => switch (this) {
    ConnStatus.ok => const Color(0xFF1D9E75),
    ConnStatus.degraded => const Color(0xFFEF9F27),
    ConnStatus.error => const Color(0xFFE24B4A),
    ConnStatus.none => const Color(0xFF888780),
  };

  Color get bg => switch (this) {
    ConnStatus.ok => const Color(0x1F1D9E75),
    ConnStatus.degraded => const Color(0x1FEF9F27),
    ConnStatus.error => const Color(0x1AE24B4A),
    ConnStatus.none => const Color(0x14888780),
  };

  Color get text => switch (this) {
    ConnStatus.ok => const Color(0xFF0F6E56),
    ConnStatus.degraded => const Color(0xFF854F0B),
    ConnStatus.error => const Color(0xFFA32D2D),
    ConnStatus.none => const Color(0xFF5F5E5A),
  };
}

ConnStatus connStatusFromBool(bool? v) =>
    v == true ? ConnStatus.ok : ConnStatus.none;

ConnStatus connStatusFromDevice(String s) =>
    switch (s.toUpperCase()) {
      'ACTIVE' || 'HEALTHY' || 'OK' || 'CONNECTED' => ConnStatus.ok,
      'CONFIGURING' || 'DEGRADED' || 'PARTIAL' => ConnStatus.degraded,
      'UNKNOWN' || '' => ConnStatus.none,
      _ => ConnStatus.error,
    };

// ─── Widgets ─────────────────────────────────────────────────────────────────

class ConnPill extends StatelessWidget {
  final String label;
  final ConnStatus status;

  const ConnPill({super.key, required this.label, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: status.bg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: status.dot,
            ),
          ),
          const SizedBox(width: 3),
          Text(label, style: TextStyle(fontSize: 10, color: status.text)),
        ],
      ),
    );
  }
}

class FlagChip extends StatelessWidget {
  final String label;
  final bool active;
  final Color activeColor;

  const FlagChip({
    super.key,
    required this.label,
    required this.active,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: active ? activeColor.withValues(alpha: 0.12) : cs.surface,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: active
              ? activeColor.withValues(alpha: 0.5)
              : cs.outlineVariant.withValues(alpha: 0.4),
          width: 0.5,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          color: active ? activeColor : cs.onSurfaceVariant,
        ),
      ),
    );
  }
}
