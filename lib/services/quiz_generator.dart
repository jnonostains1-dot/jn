import 'dart:math';

import 'package:uuid/uuid.dart';

import '../models/profile_question.dart';
import '../models/quiz.dart';

class QuizGeneratorService {
  QuizGeneratorService();

  final Random _random = Random();
  final Uuid _uuid = const Uuid();

  Quiz generateQuiz({
    required String forWho,
    required String tone,
    required int questionCount,
    required Map<String, String> responses,
  }) {
    // Filtre les questions auxquelles l'utilisateur a répondu.
    final answered = profileQuestions
        .where((question) =>
            responses[question.id] != null &&
            responses[question.id]!.trim().isNotEmpty)
        .toList();

    // Sélection aléatoire du nombre souhaité de questions.
    answered.shuffle(_random);
    final selected = answered.take(questionCount).toList();

    final questions = selected.map((question) {
      final correctAnswer = responses[question.id]!.trim();
      final options = _buildOptions(question, correctAnswer, responses);
      final correctIndex = options.indexOf(correctAnswer);
      return QuizQuestion(
        id: question.id,
        question: _decorateQuestion(question.question, tone),
        choices: options,
        correctIndex: correctIndex,
        correctAnswer: correctAnswer,
      );
    }).toList();

    return Quiz(
      id: _uuid.v4(),
      title: 'Quiz ${forWho.toLowerCase()} (${tone.toLowerCase()})',
      forWho: forWho,
      tone: tone,
      questionCount: questionCount,
      createdAt: DateTime.now(),
      questions: questions,
    );
  }

  List<String> _buildOptions(
    ProfileQuestion question,
    String correctAnswer,
    Map<String, String> responses,
  ) {
    final options = <String>[];
    if (question.isText) {
      // Réponses plausibles basées sur les autres réponses de l'utilisateur.
      final wrongPool = responses.values
          .where((value) => value.trim().isNotEmpty && value != correctAnswer)
          .toList();
      options.add(correctAnswer);
      options.addAll(_pickUnique(wrongPool, 3));
    } else {
      if (question.options != null) {
        options.addAll(question.options!);
        if (!options.contains(correctAnswer)) {
          options[0] = correctAnswer;
        }
      }
    }

    while (options.length < 4) {
      options.add(_fallbackOption(options));
    }

    options.shuffle(_random);
    return options.take(4).toList();
  }

  List<String> _pickUnique(List<String> pool, int count) {
    final results = <String>[];
    final buffer = List<String>.from(pool)..shuffle(_random);
    for (final item in buffer) {
      if (!results.contains(item)) {
        results.add(item);
      }
      if (results.length == count) {
        break;
      }
    }
    return results;
  }

  String _fallbackOption(List<String> existing) {
    const candidates = [
      'Je ne sais pas',
      'Aucune idée',
      'Mystère',
      'Surprise',
    ];
    for (final candidate in candidates) {
      if (!existing.contains(candidate)) {
        return candidate;
      }
    }
    return 'Autre';
  }

  String _decorateQuestion(String question, String tone) {
    switch (tone) {
      case 'Drôle':
        return 'Petit piège : $question';
      case 'Mix':
        return 'Question mix : $question';
      default:
        return question;
    }
  }
}
