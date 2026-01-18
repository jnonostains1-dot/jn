import 'package:quiz_ai/models/category.dart';
import 'package:quiz_ai/models/difficulty.dart';
import 'package:quiz_ai/models/question.dart';

class QuizSession {
  const QuizSession({
    required this.category,
    required this.difficulty,
    required this.questions,
    required this.timerEnabled,
    required this.shuffleAnswers,
    required this.questionsCount,
  });

  final Category category;
  final Difficulty difficulty;
  final List<Question> questions;
  final bool timerEnabled;
  final bool shuffleAnswers;
  final int questionsCount;
}
