import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_ai/features/history/stats_controller.dart';
import 'package:quiz_ai/features/settings/settings_controller.dart';
import 'package:quiz_ai/widgets/app_scaffold.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    return AppScaffold(
      title: 'Paramètres',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SwitchListTile.adaptive(
            title: const Text('Dark mode'),
            value: settings.darkMode,
            onChanged: (value) =>
                ref.read(settingsProvider.notifier).toggleDarkMode(value),
          ),
          SwitchListTile.adaptive(
            title: const Text('Minuteur par défaut'),
            value: settings.defaultTimer,
            onChanged: (value) =>
                ref.read(settingsProvider.notifier).toggleDefaultTimer(value),
          ),
          SwitchListTile.adaptive(
            title: const Text('Mélanger réponses par défaut'),
            value: settings.defaultShuffle,
            onChanged: (value) =>
                ref.read(settingsProvider.notifier).toggleDefaultShuffle(value),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Réinitialiser les records ?'),
                    content: const Text(
                      'Cela remettra à zéro le meilleur score et le nombre de parties.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('Annuler'),
                      ),
                      FilledButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text('Réinitialiser'),
                      ),
                    ],
                  );
                },
              );
              if (confirmed == true) {
                await ref.read(statsProvider.notifier).resetRecords();
              }
            },
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Réinitialiser les records'),
          ),
        ],
      ),
    );
  }
}
