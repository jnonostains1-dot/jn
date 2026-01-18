import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_ai/models/quiz_result.dart';
import 'package:quiz_ai/models/stats_state.dart';
import 'package:quiz_ai/features/settings/settings_controller.dart';
import 'package:quiz_ai/services/storage_service.dart';

final statsProvider =
    StateNotifierProvider<StatsController, StatsState>((ref) {
  final storage = ref.read(storageServiceProvider);
  return StatsController(storage)..load();
});

class StatsController extends StateNotifier<StatsState> {
  StatsController(this._storage) : super(StatsState.initial());

  final StorageService _storage;

  Future<void> load() async {
    final loaded = await _storage.loadStats();
    state = loaded;
  }

  Future<void> recordResult(QuizResult result) async {
    final history = [result, ...state.history];
    if (history.length > 20) {
      history.removeRange(20, history.length);
    }
    final bestScore = result.score > state.bestScore
        ? result.score
        : state.bestScore;
    state = state.copyWith(
      history: history,
      bestScore: bestScore,
      gamesPlayed: state.gamesPlayed + 1,
    );
    await _storage.saveStats(state);
  }

  Future<void> clearHistory() async {
    state = state.copyWith(history: []);
    await _storage.clearHistory();
    await _storage.saveStats(state);
  }

  Future<void> resetRecords() async {
    state = state.copyWith(bestScore: 0, gamesPlayed: 0);
    await _storage.resetRecords();
    await _storage.saveStats(state);
  }
}
