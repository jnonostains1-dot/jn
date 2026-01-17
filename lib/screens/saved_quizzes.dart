import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/storage_service.dart';

class SavedQuizzesPage extends StatelessWidget {
  const SavedQuizzesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final quizzes = StorageService.instance.getSavedQuizzes();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () => context.go('/'),
        ),
        title: const Text('Mes Quiz'),
      ),
      body: quizzes.isEmpty
          ? const Center(child: Text('Aucun quiz enregistré pour le moment.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: quizzes.length,
              itemBuilder: (context, index) {
                final quiz = quizzes[index];
                return Card(
                  child: ListTile(
                    title: Text(quiz.title),
                    subtitle: Text(
                      '${quiz.questionCount} questions • ${quiz.createdAt.toLocal().toString().split(' ').first}',
                    ),
                    trailing: const Icon(Icons.play_arrow),
                    onTap: () => context.go('/quiz', extra: quiz),
                  ),
                );
              },
            ),
    );
  }
}
