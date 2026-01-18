import 'dart:convert';

import 'package:quiz_ai/models/quiz_result.dart';
import 'package:quiz_ai/models/settings_data.dart';
import 'package:quiz_ai/models/stats_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const _bestScoreKey = 'best_score';
  static const _gamesPlayedKey = 'games_played';
  static const _historyKey = 'history';
  static const _darkModeKey = 'dark_mode';
  static const _defaultTimerKey = 'default_timer';
  static const _defaultShuffleKey = 'default_shuffle';

  Future<SettingsData> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    return SettingsData(
      darkMode: prefs.getBool(_darkModeKey) ?? false,
      defaultTimer: prefs.getBool(_defaultTimerKey) ?? true,
      defaultShuffle: prefs.getBool(_defaultShuffleKey) ?? true,
      isLoaded: true,
    );
  }

  Future<void> saveSettings(SettingsData settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_darkModeKey, settings.darkMode);
    await prefs.setBool(_defaultTimerKey, settings.defaultTimer);
    await prefs.setBool(_defaultShuffleKey, settings.defaultShuffle);
  }

  Future<StatsState> loadStats() async {
    final prefs = await SharedPreferences.getInstance();
    final historyRaw = prefs.getString(_historyKey);
    final history = <QuizResult>[];
    if (historyRaw != null) {
      final decoded = jsonDecode(historyRaw) as List<dynamic>;
      history.addAll(
        decoded
            .map((entry) => QuizResult.fromMap(entry as Map<String, dynamic>))
            .toList(),
      );
    }
    return StatsState(
      bestScore: prefs.getInt(_bestScoreKey) ?? 0,
      gamesPlayed: prefs.getInt(_gamesPlayedKey) ?? 0,
      history: history,
      isLoaded: true,
    );
  }

  Future<void> saveStats(StatsState stats) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_bestScoreKey, stats.bestScore);
    await prefs.setInt(_gamesPlayedKey, stats.gamesPlayed);
    final historyRaw = jsonEncode(stats.history.map((e) => e.toMap()).toList());
    await prefs.setString(_historyKey, historyRaw);
  }

  Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_historyKey);
  }

  Future<void> resetRecords() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_bestScoreKey, 0);
    await prefs.setInt(_gamesPlayedKey, 0);
  }
}
