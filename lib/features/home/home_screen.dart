import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_ai/features/history/stats_controller.dart';
import 'package:quiz_ai/widgets/app_scaffold.dart';
import 'package:quiz_ai/widgets/primary_button.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(statsProvider);
    return AppScaffold(
      title: 'Quiz AI',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _StatsCard(
            title: 'Meilleur score',
            value: stats.bestScore.toString(),
            icon: Icons.emoji_events_rounded,
          ),
          const SizedBox(height: 12),
          _StatsCard(
            title: 'Nombre de parties jouées',
            value: stats.gamesPlayed.toString(),
            icon: Icons.history_rounded,
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            label: 'Jouer',
            icon: Icons.play_arrow_rounded,
            onPressed: () => context.go('/setup'),
          ),
          const SizedBox(height: 12),
          PrimaryButton(
            label: 'Catégories',
            icon: Icons.grid_view_rounded,
            onPressed: () => context.go('/categories'),
          ),
          const SizedBox(height: 12),
          PrimaryButton(
            label: 'Historique',
            icon: Icons.list_alt_rounded,
            onPressed: () => context.go('/history'),
          ),
          const SizedBox(height: 12),
          PrimaryButton(
            label: 'Paramètres',
            icon: Icons.settings_rounded,
            onPressed: () => context.go('/settings'),
          ),
        ],
      ),
    );
  }
}

class _StatsCard extends StatelessWidget {
  const _StatsCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              child: Icon(icon),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
