import 'package:quiz_ai/models/category.dart';
import 'package:quiz_ai/models/difficulty.dart';

class QuizResult {
  const QuizResult({
    required this.category,
    required this.difficulty,
    required this.score,
    required this.correctCount,
    required this.totalQuestions,
    required this.date,
    required this.totalTimeSeconds,
    required this.timerEnabled,
  });

  final Category category;
  final Difficulty difficulty;
  final int score;
  final int correctCount;
  final int totalQuestions;
  final DateTime date;
  final int totalTimeSeconds;
  final bool timerEnabled;

  Map<String, dynamic> toMap() {
    return {
      'category': category.key,
      'difficulty': difficulty.key,
      'score': score,
      'correctCount': correctCount,
      'totalQuestions': totalQuestions,
      'date': date.toIso8601String(),
      'totalTimeSeconds': totalTimeSeconds,
      'timerEnabled': timerEnabled,
    };
  }

  factory QuizResult.fromMap(Map<String, dynamic> map) {
    return QuizResult(
      category: CategoryInfo.fromKey(map['category'] as String),
      difficulty: DifficultyInfo.fromKey(map['difficulty'] as String),
      score: map['score'] as int,
      correctCount: map['correctCount'] as int,
      totalQuestions: map['totalQuestions'] as int,
      date: DateTime.parse(map['date'] as String),
      totalTimeSeconds: map['totalTimeSeconds'] as int,
      timerEnabled: map['timerEnabled'] as bool,
    );
  }
}
