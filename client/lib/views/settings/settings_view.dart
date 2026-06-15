import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:arena_link/colors.dart';
import 'package:arena_link/providers/settings_provider.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  ConsumerState<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  late final TextEditingController _hostCtrl;
  late final TextEditingController _portCtrl;

  @override
  void initState() {
    super.initState();
    final s = ref.read(appSettingsProvider);
    _hostCtrl = TextEditingController(text: s.serverHost);
    _portCtrl = TextEditingController(text: s.serverPort.toString());
  }

  @override
  void dispose() {
    _hostCtrl.dispose();
    _portCtrl.dispose();
    super.dispose();
  }

  void _save() {
    final current = ref.read(appSettingsProvider);
    final host = _hostCtrl.text.trim();
    final port = int.tryParse(_portCtrl.text.trim()) ?? current.serverPort;
    ref.read(appSettingsProvider.notifier).update(
      current.copyWith(serverHost: host, serverPort: port),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Settings saved')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'SETTINGS',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: labelMuted,
              letterSpacing: 1.4,
            ),
          ),
          const SizedBox(height: 24),
          _Card(children: [
            _Field(
              label: 'ArenaLink Server Host',
              hint: 'localhost',
              helperText: 'IP address or hostname of the ArenaLink server.',
              controller: _hostCtrl,
            ),
            _Field(
              label: 'ArenaLink Server Port',
              hint: '9090',
              controller: _portCtrl,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
            ),
          ]),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: _save,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final List<Widget> children;
  const _Card({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: surfaceCard,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: surfaceBorder, width: 0.5),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: children
            .expand((w) => [w, const SizedBox(height: 12)])
            .toList()
          ..removeLast(),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final String label;
  final String hint;
  final String? helperText;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  const _Field({
    required this.label,
    required this.hint,
    required this.controller,
    this.helperText,
    this.inputFormatters,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: labelMuted,
            letterSpacing: 0.6,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: labelFaint),
            filled: true,
            fillColor: surfaceIdle,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: surfaceBorder, width: 0.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: surfaceBorder, width: 0.5),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            helperText: helperText,
            helperMaxLines: 3,
            helperStyle: TextStyle(fontSize: 10, color: labelFaint),
          ),
        ),
      ],
    );
  }
}
