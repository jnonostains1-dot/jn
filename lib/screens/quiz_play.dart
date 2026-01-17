import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/quiz.dart';

class QuizPlayPage extends StatefulWidget {
  const QuizPlayPage({super.key, required this.quiz});

  final Quiz quiz;

  @override
  State<QuizPlayPage> createState() => _QuizPlayPageState();
}

class _QuizPlayPageState extends State<QuizPlayPage> {
  int _currentIndex = 0;
  late final List<int> _selectedAnswers;

  @override
  void initState() {
    super.initState();
    _selectedAnswers = List<int>.filled(widget.quiz.questions.length, -1);
  }

  void _selectAnswer(int index) {
    setState(() {
      _selectedAnswers[_currentIndex] = index;
    });
  }

  void _nextQuestion() {
    if (_currentIndex < widget.quiz.questions.length - 1) {
      setState(() {
        _currentIndex += 1;
      });
    } else {
      context.go('/result', extra: QuizResultArgs(widget.quiz, _selectedAnswers));
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.quiz.questions[_currentIndex];
    final progress = (_currentIndex + 1) / widget.quiz.questions.length;
    final selected = _selectedAnswers[_currentIndex];
    final score = _selectedAnswers.asMap().entries.fold<int>(0, (total, entry) {
      final index = entry.key;
      final selectedIndex = entry.value;
      if (selectedIndex == -1) {
        return total;
      }
      return selectedIndex == widget.quiz.questions[index].correctIndex
          ? total + 1
          : total;
    });
    final feedback = selected == -1
        ? null
        : (selected == question.correctIndex ? 'Bonne réponse !' : 'Oups, raté.');

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () => context.go('/'),
        ),
        title: const Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(value: progress),
            const SizedBox(height: 16),
            Text(
              'Question ${_currentIndex + 1}/${widget.quiz.questions.length}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Score : $score',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 12),
            Text(
              question.question,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            ...List.generate(question.choices.length, (index) {
              final option = question.choices[index];
              return Card(
                child: ListTile(
                  title: Text(option),
                  leading: Radio<int>(
                    value: index,
                    groupValue: selected,
                    onChanged: (_) => _selectAnswer(index),
                  ),
                  onTap: () => _selectAnswer(index),
                ),
              );
            }),
            if (feedback != null) ...[
              const SizedBox(height: 12),
              Text(
                feedback,
                style: TextStyle(
                  color: selected == question.correctIndex
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: selected == -1 ? null : _nextQuestion,
                child: Text(
                  _currentIndex == widget.quiz.questions.length - 1
                      ? 'Voir le résultat'
                      : 'Question suivante',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizResultArgs {
  QuizResultArgs(this.quiz, this.selectedAnswers);

  final Quiz quiz;
  final List<int> selectedAnswers;
}
