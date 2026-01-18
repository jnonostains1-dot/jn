import 'package:quiz_ai/models/category.dart';
import 'package:quiz_ai/models/difficulty.dart';

class Question {
  const Question({
    required this.category,
    required this.difficulty,
    required this.text,
    required this.answers,
    required this.correctIndex,
    required this.explanation,
  });

  final Category category;
  final Difficulty difficulty;
  final String text;
  final List<String> answers;
  final int correctIndex;
  final String explanation;
}
