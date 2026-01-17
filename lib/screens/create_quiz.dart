import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/profile_question.dart';
import '../services/quiz_generator.dart';
import '../services/storage_service.dart';

class CreateQuizPage extends StatefulWidget {
  const CreateQuizPage({super.key});

  @override
  State<CreateQuizPage> createState() => _CreateQuizPageState();
}

class _CreateQuizPageState extends State<CreateQuizPage> {
  final StorageService _storage = StorageService.instance;
  final QuizGeneratorService _generator = QuizGeneratorService();

  String _forWho = 'Maman';
  String _tone = 'Normal';
  int _questionCount = 10;

  List<String> get _forWhoOptions => ['Maman', 'Pote', 'Compagnon', 'Personnalisé'];
  List<String> get _toneOptions => ['Drôle', 'Normal', 'Mix'];
  List<int> get _questionCounts => [10, 20, 30];

  Future<void> _generateQuiz() async {
    final responses = _storage.getResponses();
    final answeredCount = profileQuestions
        .where((question) => responses[question.id]?.trim().isNotEmpty == true)
        .length;
    if (answeredCount < 5) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Réponds à au moins 5 questions avant de générer un quiz.'),
          ),
        );
      }
      return;
    }

    final quiz = _generator.generateQuiz(
      forWho: _forWho,
      tone: _tone,
      questionCount: _questionCount,
      responses: responses,
    );

    await _storage.saveQuiz(quiz);
    if (mounted) {
      context.go('/quiz', extra: quiz);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () => context.go('/'),
        ),
        title: const Text('Créer un Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Pour qui ?', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _forWho,
              items: _forWhoOptions
                  .map((value) => DropdownMenuItem(value: value, child: Text(value)))
                  .toList(),
              onChanged: (value) => setState(() => _forWho = value ?? _forWho),
            ),
            const SizedBox(height: 24),
            const Text('Ton', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _tone,
              items: _toneOptions
                  .map((value) => DropdownMenuItem(value: value, child: Text(value)))
                  .toList(),
              onChanged: (value) => setState(() => _tone = value ?? _tone),
            ),
            const SizedBox(height: 24),
            const Text('Nombre de questions', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              children: _questionCounts
                  .map(
                    (count) => ChoiceChip(
                      label: Text('$count'),
                      selected: _questionCount == count,
                      onSelected: (_) => setState(() => _questionCount = count),
                    ),
                  )
                  .toList(),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _generateQuiz,
                icon: const Icon(Icons.auto_awesome),
                label: const Text('Générer le quiz'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
