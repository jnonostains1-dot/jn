import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_ai/models/question.dart';
import 'package:quiz_ai/models/quiz_session.dart';
import 'package:quiz_ai/services/question_repository.dart';

final questionRepositoryProvider = Provider<QuestionRepository>((ref) {
  return QuestionRepository();
});

final quizControllerProvider = StateNotifierProvider.autoDispose
    .family<QuizController, QuizState, QuizSession>((ref, session) {
  return QuizController(session);
});

class QuizState {
  QuizState({
    required this.session,
    required this.currentIndex,
    required this.answers,
    required this.score,
    required this.correctCount,
    required this.startTime,
  });

  final QuizSession session;
  final int currentIndex;
  final List<QuestionAnswer?> answers;
  final int score;
  final int correctCount;
  final DateTime startTime;

  QuizState copyWith({
    int? currentIndex,
    List<QuestionAnswer?>? answers,
    int? score,
    int? correctCount,
  }) {
    return QuizState(
      session: session,
      currentIndex: currentIndex ?? this.currentIndex,
      answers: answers ?? this.answers,
      score: score ?? this.score,
      correctCount: correctCount ?? this.correctCount,
      startTime: startTime,
    );
  }
}

class QuestionAnswer {
  const QuestionAnswer({
    required this.selectedIndex,
    required this.isCorrect,
    required this.timeRemaining,
  });

  final int selectedIndex;
  final bool isCorrect;
  final int timeRemaining;
}

class QuizController extends StateNotifier<QuizState> {
  QuizController(this._session)
      : super(
          QuizState(
            session: _session,
            currentIndex: 0,
            answers: List<QuestionAnswer?>.filled(_session.questions.length, null),
            score: 0,
            correctCount: 0,
            startTime: DateTime.now(),
          ),
        );

  final QuizSession _session;

  Question get currentQuestion => state.session.questions[state.currentIndex];

  bool isAnswered(int index) => state.answers[index] != null;

  void answer(int selectedIndex, int timeRemaining) {
    if (isAnswered(state.currentIndex)) {
      return;
    }
    final question = currentQuestion;
    final isCorrect = selectedIndex == question.correctIndex;
    var newScore = state.score;
    var newCorrect = state.correctCount;
    if (isCorrect) {
      newScore += 10;
      newCorrect += 1;
      if (_session.timerEnabled) {
        final bonus = ((timeRemaining / 15) * 5).floor();
        newScore += bonus;
      }
    }
    final answers = [...state.answers];
    answers[state.currentIndex] = QuestionAnswer(
      selectedIndex: selectedIndex,
      isCorrect: isCorrect,
      timeRemaining: timeRemaining,
    );
    state = state.copyWith(
      answers: answers,
      score: newScore,
      correctCount: newCorrect,
    );
  }

  void timeout() {
    answer(-1, 0);
  }

  void nextQuestion() {
    if (state.currentIndex < state.session.questions.length - 1) {
      state = state.copyWith(currentIndex: state.currentIndex + 1);
    }
  }
}
