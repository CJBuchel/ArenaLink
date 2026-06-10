import 'package:flutter/material.dart';
import 'package:arena_link/models/arena_status.dart';

class FieldStatusPanel extends StatelessWidget {
  final ArenaStatus status;

  const FieldStatusPanel({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final armor = status.plcArmorBlockStatuses;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0E1012),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF2A2E33), width: 0.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              // ── Status hero (large, part of centered content) ────────
              _StatusHero(status: status),
              const SizedBox(height: 12),

              // ── Field ────────────────────────────────────────────────
              _SectionLabel(label: 'FIELD'),
              const SizedBox(height: 6),
              _TileRow(
                children: [
                  _StatusTile(
                    icon: Icons.power_settings_new_rounded,
                    label: 'E-STOP',
                    value: status.fieldEStop ? 'ACTIVE' : 'CLEAR',
                    color: status.fieldEStop
                        ? const Color(0xFFE24B4A)
                        : const Color(0xFF1D9E75),
                    isAlert: status.fieldEStop,
                  ),
                  _StatusTile(
                    icon: Icons.memory_rounded,
                    label: 'PLC',
                    value: status.plcIsHealthy ? 'OK' : 'FAULT',
                    color: status.plcIsHealthy
                        ? const Color(0xFF1D9E75)
                        : const Color(0xFFE24B4A),
                    isAlert: !status.plcIsHealthy,
                  ),
                ],
              ),
              const SizedBox(height: 7),
              _TileRow(
                children: [
                  _StatusTile(
                    icon: Icons.wifi_rounded,
                    label: 'ACCESS PT',
                    value: _short(status.accessPointStatus),
                    color: _devColor(status.accessPointStatus),
                    isAlert: _isFault(status.accessPointStatus),
                  ),
                  _StatusTile(
                    icon: Icons.device_hub_rounded,
                    label: 'SWITCH',
                    value: _short(status.switchStatus),
                    color: _devColor(status.switchStatus),
                    isAlert: _isFault(status.switchStatus),
                  ),
                ],
              ),

              // ── SCC ──────────────────────────────────────────────────
              const SizedBox(height: 14),
              _SectionLabel(label: 'SCC'),
              const SizedBox(height: 6),
              _TileRow(
                children: [
                  _StatusTile(
                    icon: Icons.cable_rounded,
                    label: 'RED SCC',
                    value: _short(status.redSccStatus),
                    color: _devColor(status.redSccStatus),
                    accent: const Color(0xFFE24B4A),
                    isAlert: _isFault(status.redSccStatus),
                  ),
                  _StatusTile(
                    icon: Icons.cable_rounded,
                    label: 'BLUE SCC',
                    value: _short(status.blueSccStatus),
                    color: _devColor(status.blueSccStatus),
                    accent: const Color(0xFF378ADD),
                    isAlert: _isFault(status.blueSccStatus),
                  ),
                ],
              ),

              // ── Armor blocks (dynamic — keys vary by year) ───────────
              if (armor != null && armor.isNotEmpty) ...[
                const SizedBox(height: 14),
                _SectionLabel(label: 'ARMOR'),
                const SizedBox(height: 6),
                ..._armorRows(armor),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Helpers ──────────────────────────────────────────────────────────────────

String _short(String s) => switch (s.toUpperCase()) {
  'ACTIVE' || 'HEALTHY' || 'OK' || 'CONNECTED' => 'OK',
  'CONFIGURING' || 'DEGRADED' || 'PARTIAL' => 'WARN',
  'UNKNOWN' || '' => '—',
  _ => 'FAULT',
};

Color _devColor(String s) => switch (s.toUpperCase()) {
  'ACTIVE' || 'HEALTHY' || 'OK' || 'CONNECTED' => const Color(0xFF1D9E75),
  'CONFIGURING' || 'DEGRADED' || 'PARTIAL' => const Color(0xFFEF9F27),
  'UNKNOWN' || '' => const Color(0xFF888780),
  _ => const Color(0xFFE24B4A),
};

bool _isFault(String s) => switch (s.toUpperCase()) {
  'ACTIVE' || 'HEALTHY' || 'OK' || 'CONNECTED' || 'UNKNOWN' || '' => false,
  _ => true,
};

// ─── Armor block helpers (dynamic, year-agnostic) ─────────────────────────────

String _armorLabel(String key) {
  // "BlueDs" → "BLUE DS", "RedIoLink" → "RED I/O", "BlueScoring" → "BLUE SCORING"
  final spaced = key.replaceAllMapped(
    RegExp(r'(?<=[a-z])([A-Z])'),
    (m) => ' ${m.group(1)}',
  );
  return spaced.toUpperCase().replaceAll('IO LINK', 'I/O');
}

IconData _armorIcon(String key) {
  final lower = key.toLowerCase();
  if (lower.contains('io') || lower.contains('link')) {
    return Icons.settings_input_composite_rounded;
  }
  if (lower.contains('ds') || lower.contains('station'))
    return Icons.usb_rounded;
  return Icons.device_hub_rounded;
}

Color? _armorAccent(String key) {
  final lower = key.toLowerCase();
  if (lower.startsWith('red')) return const Color(0xFFE24B4A);
  if (lower.startsWith('blue')) return const Color(0xFF378ADD);
  return null;
}

// Sort armor entries: blue first, then red, then others; alphabetical within group.
int _armorSort(MapEntry<String, bool> a, MapEntry<String, bool> b) {
  int group(String k) {
    final l = k.toLowerCase();
    if (l.startsWith('blue')) return 0;
    if (l.startsWith('red')) return 1;
    return 2;
  }

  final ga = group(a.key), gb = group(b.key);
  if (ga != gb) return ga.compareTo(gb);
  return a.key.compareTo(b.key);
}

List<Widget> _armorRows(Map<String, bool> armor) {
  final entries = armor.entries.toList()..sort(_armorSort);
  final rows = <Widget>[];
  for (var i = 0; i < entries.length; i += 2) {
    if (i > 0) rows.add(const SizedBox(height: 7));
    final pair = entries.sublist(i, (i + 2).clamp(0, entries.length));
    rows.add(
      _TileRow(
        children: [
          for (final e in pair)
            _StatusTile(
              icon: _armorIcon(e.key),
              label: _armorLabel(e.key),
              value: e.value ? 'OK' : 'FAULT',
              color: e.value
                  ? const Color(0xFF1D9E75)
                  : const Color(0xFFE24B4A),
              accent: _armorAccent(e.key),
              isAlert: !e.value,
            ),
        ],
      ),
    );
  }
  return rows;
}

// ─── Status hero tile (large, full-width) ─────────────────────────────────────

class _StatusHero extends StatelessWidget {
  final ArenaStatus status;

  const _StatusHero({required this.status});

  @override
  Widget build(BuildContext context) {
    final Color bg;
    final Color fg;
    final IconData icon;
    final String text;

    if (status.fieldEStop) {
      bg = const Color(0xFFE24B4A);
      fg = Colors.white;
      icon = Icons.power_off_rounded;
      text = 'E-STOP';
    } else if (status.canStartMatch) {
      bg = const Color(0xFF1A8C64);
      fg = Colors.white;
      icon = Icons.check_circle_rounded;
      text = 'CAN START';
    } else {
      bg = const Color(0xFF181B1E);
      fg = const Color(0xFF5A6068);
      icon = Icons.hourglass_empty_rounded;
      text = 'NOT READY';
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 22, color: fg),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w900,
              color: fg,
              letterSpacing: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Section label ────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String label;

  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w700,
            color: Color(0xFF4A5058),
            letterSpacing: 1.4,
          ),
        ),
        const SizedBox(width: 6),
        const Expanded(
          child: Divider(height: 1, thickness: 0.5, color: Color(0xFF2A2E33)),
        ),
      ],
    );
  }
}

// ─── Tile row (two tiles side by side) ───────────────────────────────────────

class _TileRow extends StatelessWidget {
  final List<Widget> children;

  const _TileRow({required this.children});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (int i = 0; i < children.length; i++) ...[
            Expanded(child: children[i]),
            if (i < children.length - 1) const SizedBox(width: 6),
          ],
        ],
      ),
    );
  }
}

// ─── Status tile ─────────────────────────────────────────────────────────────
// Three visual modes driven by isAlert + whether value is unknown/unavailable.
//   alert (isAlert=true)  → vivid bg, bright border, white label
//   healthy (isAlert=false, color is not grey)  → subtle colored bg + border
//   unknown (isAlert=false, grey color)  → fully muted, grey border

class _StatusTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final Color? accent;
  final bool isAlert;

  const _StatusTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    this.accent,
    this.isAlert = false,
  });

  static const _greyColor = Color(0xFF888780);

  bool get _isUnknown => color == _greyColor;

  @override
  Widget build(BuildContext context) {
    // accent (alliance color) only applies when alerting — healthy/unknown use the status color
    final tileAccent = (isAlert && accent != null) ? accent! : color;

    final double bgAlpha;
    final double borderAlpha;
    final double borderWidth;
    final Color labelColor;

    if (isAlert) {
      bgAlpha = 0.28;
      borderAlpha = 0.85;
      borderWidth = 1.0;
      labelColor = Colors.white.withValues(alpha: 0.80);
    } else if (_isUnknown) {
      bgAlpha = 0.05;
      borderAlpha = 0.18;
      borderWidth = 0.5;
      labelColor = const Color(0xFF3E4348);
    } else {
      // healthy / ok
      bgAlpha = 0.16;
      borderAlpha = 0.45;
      borderWidth = 0.5;
      labelColor = color.withValues(alpha: 0.60);
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      decoration: BoxDecoration(
        color: tileAccent.withValues(alpha: bgAlpha),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: tileAccent.withValues(alpha: borderAlpha),
          width: borderWidth,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: color,
              height: 1.0,
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w600,
              color: labelColor,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
