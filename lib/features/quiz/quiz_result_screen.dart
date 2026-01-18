import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:quiz_ai/features/history/stats_controller.dart';
import 'package:quiz_ai/models/quiz_result.dart';
import 'package:quiz_ai/widgets/app_scaffold.dart';
import 'package:quiz_ai/widgets/primary_button.dart';

class QuizResultScreen extends ConsumerStatefulWidget {
  const QuizResultScreen({super.key, required this.result});

  final QuizResult result;

  @override
  ConsumerState<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends ConsumerState<QuizResultScreen> {
  var _saved = false;
  late final bool _isNewRecord;

  @override
  void initState() {
    super.initState();
    _isNewRecord = widget.result.score > ref.read(statsProvider).bestScore;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_saved) {
        _saved = true;
        ref.read(statsProvider.notifier).recordResult(widget.result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final timeLabel = widget.result.timerEnabled
        ? '${widget.result.totalTimeSeconds}s'
        : 'Minuteur désactivé';
    final dateLabel = DateFormat('dd/MM/yyyy HH:mm').format(widget.result.date);

    return AppScaffold(
      title: 'Résultats',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.surfaceVariant,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Score total',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.result.score.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Bonnes réponses : ${widget.result.correctCount} / ${widget.result.totalQuestions}',
                  ),
                  const SizedBox(height: 4),
                  Text('Temps total : $timeLabel'),
                  const SizedBox(height: 4),
                  Text('Partie du $dateLabel'),
                  if (_isNewRecord) ...[
                    const SizedBox(height: 12),
                    Row(
                      children: const [
                        Icon(Icons.emoji_events_rounded),
                        SizedBox(width: 8),
                        Text('Nouveau record !'),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            label: 'Rejouer',
            icon: Icons.replay_rounded,
            onPressed: () => context.go('/setup'),
          ),
          const SizedBox(height: 12),
          PrimaryButton(
            label: 'Partager le score',
            icon: Icons.share_rounded,
            onPressed: () async {
              final text =
                  'J’ai obtenu ${widget.result.score} points sur Quiz AI !';
              await Clipboard.setData(ClipboardData(text: text));
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Score copié !')),
                );
              }
            },
          ),
          const SizedBox(height: 12),
          PrimaryButton(
            label: 'Retour accueil',
            icon: Icons.home_rounded,
            onPressed: () => context.go('/'),
          ),
        ],
      ),
    );
  }
}
