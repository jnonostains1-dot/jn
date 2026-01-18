import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:quiz_ai/features/history/stats_controller.dart';
import 'package:quiz_ai/widgets/app_scaffold.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(statsProvider);
    return AppScaffold(
      title: 'Historique',
      actions: [
        IconButton(
          tooltip: 'Effacer l’historique',
          onPressed: stats.history.isEmpty
              ? null
              : () async {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Supprimer l’historique ?'),
                        content: const Text(
                          'Cette action supprimera les 20 dernières parties.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('Annuler'),
                          ),
                          FilledButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text('Supprimer'),
                          ),
                        ],
                      );
                    },
                  );
                  if (confirmed == true) {
                    await ref.read(statsProvider.notifier).clearHistory();
                  }
                },
          icon: const Icon(Icons.delete_outline_rounded),
        ),
      ],
      child: stats.history.isEmpty
          ? const Center(
              child: Text('Aucune partie enregistrée.'),
            )
          : ListView.separated(
              itemCount: stats.history.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final entry = stats.history[index];
                final date = DateFormat('dd/MM/yyyy HH:mm').format(entry.date);
                return Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${entry.category.label} • ${entry.difficulty.label}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text('Score : ${entry.score}'),
                        Text(
                          'Bonnes réponses : ${entry.correctCount} / ${entry.totalQuestions}',
                        ),
                        Text('Date : $date'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
