import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/quiz.dart';
import 'quiz_play.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.args});

  final QuizResultArgs args;

  @override
  Widget build(BuildContext context) {
    final quiz = args.quiz;
    final selections = args.selectedAnswers;
    final total = quiz.questions.length;
    var score = 0;
    final errors = <_ErrorItem>[];

    for (var i = 0; i < quiz.questions.length; i++) {
      final question = quiz.questions[i];
      if (selections[i] == question.correctIndex) {
        score += 1;
      } else {
        errors.add(_ErrorItem(question: question, selectedIndex: selections[i]));
      }
    }

    final percent = ((score / total) * 100).round();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () => context.go('/'),
        ),
        title: const Text('Résultat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Score : $score / $total',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Tu me connais à $percent%',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            Text(
              'Erreurs',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: errors.isEmpty
                  ? const Center(child: Text('Aucune erreur, bravo !'))
                  : ListView.builder(
                      itemCount: errors.length,
                      itemBuilder: (context, index) {
                        final error = errors[index];
                        final question = error.question;
                        final selectedIndex = error.selectedIndex;
                        final selectedAnswer = selectedIndex >= 0
                            ? question.options[selectedIndex]
                            : 'Pas de réponse';
                        return Card(
                          child: ListTile(
                            title: Text(question.question),
                            subtitle: Text(
                              'Ta réponse : $selectedAnswer\nBonne réponse : ${question.correctAnswer}',
                            ),
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.go('/quiz', extra: quiz),
                    child: const Text('Rejouer'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton(
                    onPressed: () => context.go('/'),
                    child: const Text('Accueil'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorItem {
  const _ErrorItem({required this.question, required this.selectedIndex});

  final QuizQuestion question;
  final int selectedIndex;
}
