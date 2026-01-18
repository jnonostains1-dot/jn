import 'package:quiz_ai/models/quiz_result.dart';

class StatsState {
  const StatsState({
    required this.bestScore,
    required this.gamesPlayed,
    required this.history,
    required this.isLoaded,
  });

  final int bestScore;
  final int gamesPlayed;
  final List<QuizResult> history;
  final bool isLoaded;

  StatsState copyWith({
    int? bestScore,
    int? gamesPlayed,
    List<QuizResult>? history,
    bool? isLoaded,
  }) {
    return StatsState(
      bestScore: bestScore ?? this.bestScore,
      gamesPlayed: gamesPlayed ?? this.gamesPlayed,
      history: history ?? this.history,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }

  factory StatsState.initial() {
    return const StatsState(
      bestScore: 0,
      gamesPlayed: 0,
      history: [],
      isLoaded: false,
    );
  }
}
