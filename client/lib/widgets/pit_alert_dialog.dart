import 'package:flutter/material.dart';
import 'package:arena_link/colors.dart';
import 'package:arena_link/models/pit_alert.dart';

// ─── Public entry-point ───────────────────────────────────────────────────────

/// Show the pit alert dialog and return the submission, or null if cancelled.
///
/// Works from any view — field monitor (with live stats) or teams list
/// (pit-mode, no telemetry).
Future<PitAlertSubmission?> showPitAlertDialog(
  BuildContext context,
  PitAlertContext alertContext,
) {
  return showDialog<PitAlertSubmission>(
    context: context,
    barrierDismissible: false,
    builder: (_) => PitAlertDialog(ctx: alertContext),
  );
}

// ─── Dialog widget ────────────────────────────────────────────────────────────

class PitAlertDialog extends StatefulWidget {
  final PitAlertContext ctx;

  const PitAlertDialog({super.key, required this.ctx});

  @override
  State<PitAlertDialog> createState() => _PitAlertDialogState();
}

class _PitAlertDialogState extends State<PitAlertDialog> {
  PitAlertType? _selectedType;
  final Set<String> _subIssues = {};
  final Set<AlertRecipient> _recipients = {};
  bool _noneSelected = false;
  final _notesController = TextEditingController();

  PitAlertContext get ctx => widget.ctx;

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  void _selectType(PitAlertType type) {
    setState(() {
      _selectedType = type;
      _subIssues.clear(); // reset sub-issue selection when type changes
      // No auto-selection of recipients — user must choose explicitly.
    });
  }

  void _toggleSubIssue(String issue) {
    setState(() {
      if (_subIssues.contains(issue)) {
        _subIssues.remove(issue);
      } else {
        _subIssues.add(issue);
      }
    });
  }

  void _toggleRecipient(AlertRecipient r) {
    setState(() {
      _noneSelected = false;
      if (_recipients.contains(r)) {
        _recipients.remove(r);
      } else {
        _recipients.add(r);
      }
    });
  }

  void _toggleNone() {
    setState(() {
      if (_noneSelected) {
        _noneSelected = false;
      } else {
        _noneSelected = true;
        _recipients.clear();
      }
    });
  }

  bool get _canSubmit =>
      _selectedType != null && (_recipients.isNotEmpty || _noneSelected);

  void _submit() {
    if (!_canSubmit) return;
    final notes = _notesController.text.trim();
    Navigator.of(context).pop(
      PitAlertSubmission(
        context: ctx,
        alertType: _selectedType!,
        subIssues: List.unmodifiable(_subIssues.toList()),
        recipients: List.unmodifiable(_recipients.toList()),
        fieldNotes: notes.isEmpty ? null : notes,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: surfaceCard,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 680),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Header(ctx: ctx),
            const Divider(height: 1, color: surfaceBorder),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _SectionLabel('ISSUE TYPE'),
                    const SizedBox(height: 10),
                    _TypeSelector(
                      selected: _selectedType,
                      onSelect: _selectType,
                    ),
                    if (_selectedType != null &&
                        _selectedType!.subIssues.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      const Divider(color: surfaceBorder),
                      const SizedBox(height: 12),
                      _SectionLabel('SPECIFIC ISSUE'),
                      const SizedBox(height: 10),
                      _SubIssueSelector(
                        issues: _selectedType!.subIssues,
                        selected: _subIssues,
                        onToggle: _toggleSubIssue,
                      ),
                    ],
                    const SizedBox(height: 16),
                    const Divider(color: surfaceBorder),
                    const SizedBox(height: 12),
                    _SectionLabel('NOTIFY'),
                    const SizedBox(height: 4),
                    Text(
                      'Select at least one recipient, or "None" to file without notification.',
                      style: const TextStyle(fontSize: 10, color: labelMuted),
                    ),
                    const SizedBox(height: 10),
                    _RecipientSelector(
                      selected: _recipients,
                      noneSelected: _noneSelected,
                      onToggle: _toggleRecipient,
                      onToggleNone: _toggleNone,
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: surfaceBorder),
                    const SizedBox(height: 12),
                    _SectionLabel('FIELD NOTES  (optional)'),
                    const SizedBox(height: 10),
                    _NotesField(controller: _notesController),
                  ],
                ),
              ),
            ),
            const Divider(height: 1, color: surfaceBorder),
            _Footer(
              canSubmit: _canSubmit,
              onCancel: () => Navigator.of(context).pop(),
              onSubmit: _submit,
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Header ───────────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  final PitAlertContext ctx;

  const _Header({required this.ctx});

  @override
  Widget build(BuildContext context) {
    // Timing badge — shown only when there's a live match running
    Widget? timingBadge;
    if (ctx.matchName.isNotEmpty) {
      final timeStr = switch (ctx.timeRemainingSec) {
        int sec when sec > 0 => '${ctx.matchStateLabel} · ${sec}s left',
        int _ => ctx.matchStateLabel,
        null => ctx.matchStateLabel,
      };
      final parts = [
        ctx.matchName,
        if (ctx.matchTypeLabel.isNotEmpty) ctx.matchTypeLabel,
        if (timeStr.isNotEmpty) timeStr,
      ];
      timingBadge = Text(
        parts.join(' · '),
        style: const TextStyle(
          fontSize: 11,
          color: labelDim,
          letterSpacing: 0.3,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          const Icon(Icons.flag_rounded, color: arenaAmber, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pit Alert — ${ctx.teamDisplay} [${ctx.stationLabel}]',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: labelFaint,
                  ),
                ),
                if (timingBadge != null) ...[
                  const SizedBox(height: 2),
                  timingBadge,
                ],
              ],
            ),
          ),
          if (ctx.scheduledStart != null)
            _Badge(
              icon: Icons.schedule_rounded,
              label: ctx.scheduledStart!,
              color: labelDim,
            ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _Badge({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 11, color: color),
          const SizedBox(width: 4),
          Text(label, style: TextStyle(fontSize: 11, color: color)),
        ],
      ),
    );
  }
}

// ─── Section label ────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String text;

  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w800,
        color: labelMuted,
        letterSpacing: 1.2,
      ),
    );
  }
}

// ─── Issue type selector ──────────────────────────────────────────────────────

class _TypeSelector extends StatelessWidget {
  final PitAlertType? selected;
  final ValueChanged<PitAlertType> onSelect;

  const _TypeSelector({required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _GroupSection(
          groupLabel: 'Robot / Electronics',
          types: [
            PitAlertType.battery,
            PitAlertType.rio,
            PitAlertType.code,
            PitAlertType.radio,
            PitAlertType.noDs,
            PitAlertType.eStop,
          ],
          selected: selected,
          onSelect: onSelect,
        ),
        const SizedBox(height: 10),
        _GroupSection(
          groupLabel: 'Inspection / Mechanical',
          types: [
            PitAlertType.mechanical,
            PitAlertType.reinspect,
            PitAlertType.electrical,
          ],
          selected: selected,
          onSelect: onSelect,
        ),
        const SizedBox(height: 10),
        _GroupSection(
          groupLabel: 'Support / Other',
          types: [PitAlertType.csa, PitAlertType.inspector, PitAlertType.custom],
          selected: selected,
          onSelect: onSelect,
        ),
      ],
    );
  }
}

class _GroupSection extends StatelessWidget {
  final String groupLabel;
  final List<PitAlertType> types;
  final PitAlertType? selected;
  final ValueChanged<PitAlertType> onSelect;

  const _GroupSection({
    required this.groupLabel,
    required this.types,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          groupLabel,
          style: const TextStyle(fontSize: 9, color: labelDim, letterSpacing: 0.8),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: types.map((t) => _TypeChip(
            type: t,
            isSelected: selected == t,
            onTap: () => onSelect(t),
          )).toList(),
        ),
      ],
    );
  }
}

class _TypeChip extends StatelessWidget {
  final PitAlertType type;
  final bool isSelected;
  final VoidCallback onTap;

  const _TypeChip({
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  Color get _chipColor => switch (type.group) {
    AlertGroup.robot       => arenaRed,
    AlertGroup.inspection  => arenaAmber,
    AlertGroup.support     => arenaBlue,
    AlertGroup.general     => arenaGrey,
  };

  @override
  Widget build(BuildContext context) {
    final color = _chipColor;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 140),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? color.withValues(alpha: 0.20) : surfaceBar,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? color.withValues(alpha: 0.70) : surfaceBorder,
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(type.icon, size: 14, color: isSelected ? color : labelDim),
            const SizedBox(width: 5),
            Text(
              type.label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: isSelected ? color : labelDim,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Sub-issue selector ───────────────────────────────────────────────────────

class _SubIssueSelector extends StatelessWidget {
  final List<String> issues;
  final Set<String> selected;
  final ValueChanged<String> onToggle;

  const _SubIssueSelector({
    required this.issues,
    required this.selected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: issues.map((issue) {
        final isOn = selected.contains(issue);
        return GestureDetector(
          onTap: () => onToggle(issue),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 140),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            decoration: BoxDecoration(
              color: isOn ? arenaAmber.withValues(alpha: 0.18) : surfaceBar,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isOn ? arenaAmber.withValues(alpha: 0.60) : surfaceBorder,
                width: isOn ? 1.5 : 1.0,
              ),
            ),
            child: Text(
              issue,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isOn ? arenaAmber : labelDim,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ─── Recipient selector ───────────────────────────────────────────────────────

class _RecipientSelector extends StatelessWidget {
  final Set<AlertRecipient> selected;
  final bool noneSelected;
  final ValueChanged<AlertRecipient> onToggle;
  final VoidCallback onToggleNone;

  const _RecipientSelector({
    required this.selected,
    required this.noneSelected,
    required this.onToggle,
    required this.onToggleNone,
  });

  Widget _chip({
    required String label,
    required String description,
    required bool isOn,
    required Color activeColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 140),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: isOn ? activeColor.withValues(alpha: 0.18) : surfaceBar,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isOn ? activeColor.withValues(alpha: 0.60) : surfaceBorder,
            width: isOn ? 1.5 : 1.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: isOn ? activeColor : labelDim,
                letterSpacing: 0.4,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              description,
              style: TextStyle(
                fontSize: 8.5,
                color: isOn ? activeColor.withValues(alpha: 0.65) : labelMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: [
        ...AlertRecipient.values.map((r) => _chip(
          label: r.label,
          description: r.description,
          isOn: selected.contains(r),
          activeColor: arenaBlue,
          onTap: () => onToggle(r),
        )),
        _chip(
          label: 'None',
          description: 'No notification',
          isOn: noneSelected,
          activeColor: labelDim,
          onTap: onToggleNone,
        ),
      ],
    );
  }
}

// ─── Notes field ──────────────────────────────────────────────────────────────

class _NotesField extends StatelessWidget {
  final TextEditingController controller;

  const _NotesField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 3,
      style: const TextStyle(fontSize: 13, color: labelFaint),
      decoration: InputDecoration(
        hintText: 'Describe the issue, any context…',
        hintStyle: const TextStyle(color: labelMuted, fontSize: 13),
        filled: true,
        fillColor: surfaceBar,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: surfaceBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: surfaceBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              const BorderSide(color: arenaAmber, width: 1.5),
        ),
      ),
    );
  }
}

// ─── Footer ───────────────────────────────────────────────────────────────────

class _Footer extends StatelessWidget {
  final bool canSubmit;
  final VoidCallback onCancel;
  final VoidCallback onSubmit;

  const _Footer({
    required this.canSubmit,
    required this.onCancel,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: onCancel,
            child: const Text(
              'Cancel',
              style: TextStyle(color: labelDim),
            ),
          ),
          const SizedBox(width: 10),
          FilledButton.icon(
            onPressed: canSubmit ? onSubmit : null,
            style: FilledButton.styleFrom(
              backgroundColor: canSubmit ? arenaAmber : labelMuted,
              foregroundColor: Colors.black87,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: const Icon(Icons.send_rounded, size: 16),
            label: const Text(
              'Submit Alert',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

