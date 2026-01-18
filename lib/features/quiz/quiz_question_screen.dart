import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_ai/features/quiz/quiz_controller.dart';
import 'package:quiz_ai/models/quiz_result.dart';
import 'package:quiz_ai/models/quiz_session.dart';
import 'package:quiz_ai/widgets/answer_tile.dart';
import 'package:quiz_ai/widgets/app_scaffold.dart';
import 'package:quiz_ai/widgets/primary_button.dart';

class QuizQuestionScreen extends ConsumerStatefulWidget {
  const QuizQuestionScreen({super.key, required this.session});

  final QuizSession session;

  @override
  ConsumerState<QuizQuestionScreen> createState() => _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends ConsumerState<QuizQuestionScreen> {
  static const _timeLimit = 15;
  Timer? _timer;
  int _timeRemaining = _timeLimit;
  late final ProviderSubscription<QuizState> _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = ref.listen<QuizState>(
      quizControllerProvider(widget.session),
      (previous, next) {
        if (previous?.currentIndex != next.currentIndex) {
          _resetTimer();
        }
      },
    );
    _resetTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _subscription.close();
    super.dispose();
  }

  void _resetTimer() {
    _timer?.cancel();
    if (!widget.session.timerEnabled) {
      return;
    }
    setState(() => _timeRemaining = _timeLimit);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeRemaining <= 1) {
        timer.cancel();
        setState(() => _timeRemaining = 0);
        ref.read(quizControllerProvider(widget.session).notifier).timeout();
      } else {
        setState(() => _timeRemaining -= 1);
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(quizControllerProvider(widget.session));
    final controller = ref.read(quizControllerProvider(widget.session).notifier);
    final question = state.session.questions[state.currentIndex];
    final answer = state.answers[state.currentIndex];
    final isLocked = answer != null;
    final progress = (state.currentIndex + 1) / state.session.questions.length;

    return AppScaffold(
      title: 'Question',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${state.session.category.label} • ${state.session.difficulty.label}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Question ${state.currentIndex + 1} / ${state.session.questions.length}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: progress),
          const SizedBox(height: 16),
          if (state.session.timerEnabled) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Temps restant',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '${_timeRemaining}s',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 6),
            LinearProgressIndicator(value: _timeRemaining / _timeLimit),
            const SizedBox(height: 16),
          ],
          Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.surfaceVariant,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                question.text,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(question.answers.length, (index) {
            final isCorrect = index == question.correctIndex;
            final isSelected = answer?.selectedIndex == index;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AnswerTile(
                label: String.fromCharCode(65 + index),
                text: question.answers[index],
                isLocked: isLocked,
                isCorrect: isCorrect,
                isSelected: isSelected,
                onTap: () {
                  _stopTimer();
                  controller.answer(index, _timeRemaining);
                },
              ),
            );
          }),
          if (isLocked) ...[
            const SizedBox(height: 8),
            Text(
              question.explanation,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              label: state.currentIndex == state.session.questions.length - 1
                  ? 'Voir les résultats'
                  : 'Question suivante',
              icon: Icons.navigate_next_rounded,
              onPressed: () {
                if (state.currentIndex ==
                    state.session.questions.length - 1) {
                  final totalTime =
                      DateTime.now().difference(state.startTime).inSeconds;
                  final result = QuizResult(
                    category: state.session.category,
                    difficulty: state.session.difficulty,
                    score: state.score,
                    correctCount: state.correctCount,
                    totalQuestions: state.session.questions.length,
                    date: DateTime.now(),
                    totalTimeSeconds: totalTime,
                    timerEnabled: state.session.timerEnabled,
                  );
                  context.go('/result', extra: result);
                } else {
                  controller.nextQuestion();
                }
              },
            ),
          ],
        ],
      ),
    );
  }
}
