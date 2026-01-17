import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/quiz.dart';

class StorageService {
  StorageService._();

  static final StorageService instance = StorageService._();

  Box? _profileBox;
  Box? _quizBox;

  Future<void> init() async {
    await Hive.initFlutter();
    _profileBox = await Hive.openBox('profile');
    _quizBox = await Hive.openBox('quizzes');
  }

  Map<String, String> getResponses() {
    final stored = _profileBox?.get('responses') as Map? ?? {};
    return Map<String, String>.from(stored);
  }

  Future<void> saveResponse(String questionId, String answer) async {
    final responses = getResponses();
    responses[questionId] = answer;
    await _profileBox?.put('responses', responses);
  }

  List<Quiz> getSavedQuizzes() {
    final stored = _quizBox?.get('saved') as List? ?? [];
    return stored
        .map((item) => Quiz.fromMap(Map<String, dynamic>.from(item as Map)))
        .toList();
  }

  Future<void> saveQuiz(Quiz quiz) async {
    final quizzes = getSavedQuizzes();
    quizzes.removeWhere((item) => item.id == quiz.id);
    quizzes.insert(0, quiz);
    await _quizBox?.put('saved', quizzes.map((q) => q.toMap()).toList());
  }
}
