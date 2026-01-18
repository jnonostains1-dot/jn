import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_ai/models/settings_data.dart';
import 'package:quiz_ai/services/storage_service.dart';

final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService();
});

final settingsProvider =
    StateNotifierProvider<SettingsController, SettingsData>((ref) {
  final storage = ref.read(storageServiceProvider);
  return SettingsController(storage)..load();
});

class SettingsController extends StateNotifier<SettingsData> {
  SettingsController(this._storage) : super(SettingsData.initial());

  final StorageService _storage;

  Future<void> load() async {
    final settings = await _storage.loadSettings();
    state = settings;
  }

  Future<void> toggleDarkMode(bool value) async {
    state = state.copyWith(darkMode: value);
    await _storage.saveSettings(state);
  }

  Future<void> toggleDefaultTimer(bool value) async {
    state = state.copyWith(defaultTimer: value);
    await _storage.saveSettings(state);
  }

  Future<void> toggleDefaultShuffle(bool value) async {
    state = state.copyWith(defaultShuffle: value);
    await _storage.saveSettings(state);
  }
}
