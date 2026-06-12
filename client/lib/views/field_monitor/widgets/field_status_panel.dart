import 'package:flutter/material.dart';
import 'package:arena_link/colors.dart';
import 'package:arena_link/models/arena_state.dart';
import 'package:arena_link/widgets/barber_pole_container.dart';

class FieldStatusPanel extends StatelessWidget {
  final FieldMonitorState field;

  const FieldStatusPanel({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    final hw = field.hardware;
    final armor = hw.armorBlocks;

    final fieldTiles = <_StatusTile>[
      if (hw.plcHealthy) ...[
        _StatusTile(
          icon: Icons.power_settings_new_rounded,
          label: 'E-STOP',
          value: hw.plcEStop ? 'ACTIVE' : 'CLEAR',
          color: hw.plcEStop ? arenaRed : arenaGreen,
          isAlert: hw.plcEStop,
        ),
        _StatusTile(
          icon: Icons.memory_rounded,
          label: 'PLC',
          value: 'OK',
          color: arenaGreen,
          isAlert: false,
        ),
      ],
      if (hw.accessPointConfigured)
        _StatusTile(
          icon: Icons.wifi_rounded,
          label: 'ACCESS PT',
          value: _short(hw.accessPointStatus),
          color: _devColor(hw.accessPointStatus),
          isAlert: _isFault(hw.accessPointStatus),
        ),
      if (hw.switchConfigured)
        _StatusTile(
          icon: Icons.device_hub_rounded,
          label: 'SWITCH',
          value: _short(hw.switchStatus),
          color: _devColor(hw.switchStatus),
          isAlert: _isFault(hw.switchStatus),
        ),
    ];

    final sccTiles = <_StatusTile>[
      if (hw.redSccConfigured)
        _StatusTile(
          icon: Icons.cable_rounded,
          label: 'RED SCC',
          value: _short(hw.redSccStatus),
          color: _devColor(hw.redSccStatus),
          accent: arenaRed,
          isAlert: _isFault(hw.redSccStatus),
        ),
      if (hw.blueSccConfigured)
        _StatusTile(
          icon: Icons.cable_rounded,
          label: 'BLUE SCC',
          value: _short(hw.blueSccStatus),
          color: _devColor(hw.blueSccStatus),
          accent: arenaBlue,
          isAlert: _isFault(hw.blueSccStatus),
        ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: surfaceCard,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: surfaceBorder, width: 0.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              _StatusHero(field: field),
              const SizedBox(height: 12),

              if (fieldTiles.isNotEmpty) ...[
                _SectionLabel(label: 'FIELD'),
                const SizedBox(height: 6),
                ..._tileRows(fieldTiles),
              ],

              if (sccTiles.isNotEmpty) ...[
                const SizedBox(height: 14),
                _SectionLabel(label: 'SCC'),
                const SizedBox(height: 6),
                ..._tileRows(sccTiles),
              ],

              if (hw.plcHealthy && armor.isNotEmpty) ...[
                const SizedBox(height: 14),
                _SectionLabel(label: 'IO'),
                const SizedBox(height: 6),
                ..._armorRows(armor),
              ],

              // Scoring only meaningful in postMatch — ref panel is active then.
              if (field.matchState == MatchStateConst.postMatch ||
                  field.matchState == MatchStateConst.postTimeout) ...[
                const SizedBox(height: 14),
                _SectionLabel(label: 'SCORE'),
                const SizedBox(height: 6),
                ..._scoringTiles(hw),
              ],

              const SizedBox(height: 12),
              _FieldStateFooter(field: field),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Helpers ──────────────────────────────────────────────────────────────────

String _short(String? s) => switch (s?.toUpperCase()) {
  null || '' => '—',
  'ACTIVE' || 'HEALTHY' || 'OK' || 'CONNECTED' => 'OK',
  'CONFIGURING' || 'DEGRADED' || 'PARTIAL' => 'WARN',
  _ => 'FAULT',
};

Color _devColor(String? s) => switch (s?.toUpperCase()) {
  'ACTIVE' || 'HEALTHY' || 'OK' || 'CONNECTED' => arenaGreen,
  'CONFIGURING' || 'DEGRADED' || 'PARTIAL' => arenaAmber,
  null || '' => arenaGrey, // not configured / unknown
  _ => arenaRed,           // explicit fault
};

bool _isFault(String? s) => switch (s?.toUpperCase()) {
  null || '' || 'ACTIVE' || 'HEALTHY' || 'OK' || 'CONNECTED' => false,
  'CONFIGURING' || 'DEGRADED' || 'PARTIAL' => true,
  _ => true,
};

// ─── Scoring tiles ────────────────────────────────────────────────────────────

const _posOrder = ['red_near', 'red_far', 'blue_near', 'blue_far'];

String _posLabel(String key) => switch (key) {
  'red_near' => 'RED NEAR',
  'red_far' => 'RED FAR',
  'blue_near' => 'BLU NEAR',
  'blue_far' => 'BLU FAR',
  _ => key.toUpperCase().replaceAll('_', ' '),
};

List<Widget> _scoringTiles(HardwareState hw) {
  final tiles = <_StatusTile>[
    _StatusTile(
      icon: Icons.gavel_rounded,
      label: 'HEAD REF',
      value: hw.refereeReady ? 'DONE' : 'PEND',
      color: hw.refereeReady ? arenaGreen : arenaAmber,
      isAlert: !hw.refereeReady,
    ),
    for (final key in _posOrder)
      if (hw.scoringPositions.containsKey(key) &&
          hw.scoringPositions[key]!.numPanels > 0)
        _StatusTile(
          icon: Icons.score_rounded,
          label: _posLabel(key),
          value: hw.scoringPositions[key]!.ready
              ? 'DONE'
              : '${hw.scoringPositions[key]!.numPanelsReady}'
                    '/${hw.scoringPositions[key]!.numPanels}',
          color: hw.scoringPositions[key]!.ready ? arenaGreen : arenaAmber,
          accent: key.startsWith('red') ? arenaRed : arenaBlue,
          isAlert: !hw.scoringPositions[key]!.ready,
        ),
  ];
  return _tileRows(tiles);
}

// ─── Generic tile row helper ──────────────────────────────────────────────────

List<Widget> _tileRows(List<_StatusTile> tiles) {
  final rows = <Widget>[];
  for (var i = 0; i < tiles.length; i += 2) {
    if (i > 0) rows.add(const SizedBox(height: 7));
    rows.add(
      _TileRow(children: tiles.sublist(i, (i + 2).clamp(0, tiles.length))),
    );
  }
  return rows;
}

// ─── Armor block helpers ──────────────────────────────────────────────────────

String _armorLabel(String key) {
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
  if (lower.contains('ds') || lower.contains('station')) {
    return Icons.usb_rounded;
  }
  return Icons.device_hub_rounded;
}

Color? _armorAccent(String key) {
  final lower = key.toLowerCase();
  if (lower.startsWith('red')) return arenaRed;
  if (lower.startsWith('blue')) return arenaBlue;
  return null;
}

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
              color: e.value ? arenaGreen : arenaRed,
              accent: _armorAccent(e.key),
              isAlert: !e.value,
            ),
        ],
      ),
    );
  }
  return rows;
}

// ─── Field state footer ───────────────────────────────────────────────────────

const _kFooterHeight = 42.0;

Widget _footerLabel({
  required IconData icon,
  required String text,
  required Color fg,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 16, color: fg),
      const SizedBox(width: 6),
      Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w900,
          color: fg,
          letterSpacing: 1.8,
        ),
      ),
    ],
  );
}

Widget _solidFooter({
  required Color bg,
  required String text,
  required IconData icon,
  Color fg = Colors.white,
}) {
  return Container(
    height: _kFooterHeight,
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(8),
    ),
    alignment: Alignment.center,
    child: _footerLabel(icon: icon, text: text, fg: fg),
  );
}

class _FieldStateFooter extends StatelessWidget {
  final FieldMonitorState field;

  const _FieldStateFooter({required this.field});

  @override
  Widget build(BuildContext context) {
    final hw = field.hardware;

    if (hw.fieldEStopActive) {
      return _solidFooter(
        bg: bgEStop,
        icon: Icons.power_off_rounded,
        text: 'E-STOP',
      );
    }

    final ms = field.matchState;

    if (field.displayMode == 'signalCount') {
      return _solidFooter(
        bg: Colors.purple,
        icon: Icons.timer_rounded,
        text: 'COUNT',
      );
    }

    if (field.displayMode == 'fieldReset') {
      return _solidFooter(bg: bgSafe, icon: Icons.shield_rounded, text: 'SAFE');
    }

    if (ms == MatchStateConst.preMatch && field.canStartMatch) {
      return BarberPoleContainer(
        color: bgArmed,
        stripeColor: bgArmedStripe,
        borderRadius: BorderRadius.circular(8),
        height: _kFooterHeight,
        duration: 3,
        child: Center(
          child: _footerLabel(
            icon: Icons.lock_open_rounded,
            text: 'ARMED',
            fg: Colors.white,
          ),
        ),
      );
    }

    if (ms == MatchStateConst.startMatch ||
        ms == MatchStateConst.autoPeriod ||
        ms == MatchStateConst.pausePeriod ||
        ms == MatchStateConst.teleopPeriod ||
        ms == MatchStateConst.timeoutActive) {
      return _solidFooter(
        bg: Colors.blue,
        icon: Icons.timer_rounded,
        text: 'MATCH',
      );
    }

    return _solidFooter(
      bg: surfaceIdle,
      icon: Icons.hourglass_empty_rounded,
      text: 'IDLE',
      fg: labelIdle,
    );
  }
}

// ─── Status hero ──────────────────────────────────────────────────────────────

class _StatusHero extends StatelessWidget {
  final FieldMonitorState field;

  const _StatusHero({required this.field});

  @override
  Widget build(BuildContext context) {
    final hw = field.hardware;
    final ms = field.matchState;

    final Color bg;
    final Color fg;
    final IconData icon;
    final String text;

    if (hw.fieldEStopActive) {
      bg = arenaRed;
      fg = Colors.white;
      icon = Icons.power_off_rounded;
      text = 'E-STOP';
    } else if (ms == MatchStateConst.startMatch ||
        ms == MatchStateConst.autoPeriod ||
        ms == MatchStateConst.pausePeriod ||
        ms == MatchStateConst.teleopPeriod) {
      bg = Colors.blue;
      fg = Colors.white;
      icon = Icons.timer_rounded;
      text = 'MATCH';
    } else if (field.canStartMatch) {
      bg = phaseTeleopTeal;
      fg = Colors.white;
      icon = Icons.check_circle_rounded;
      text = 'READY';
    } else {
      bg = surfaceIdle;
      fg = labelDimmer;
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
            color: labelMuted,
            letterSpacing: 1.4,
          ),
        ),
        const SizedBox(width: 6),
        const Expanded(
          child: Divider(height: 1, thickness: 0.5, color: surfaceBorder),
        ),
      ],
    );
  }
}

// ─── Tile row ─────────────────────────────────────────────────────────────────

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

// ─── Status tile ──────────────────────────────────────────────────────────────

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

  static const _greyColor = arenaGrey;

  bool get _isUnknown => color == _greyColor;

  @override
  Widget build(BuildContext context) {
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
      labelColor = labelIdle;
    } else {
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
