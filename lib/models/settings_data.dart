class SettingsData {
  const SettingsData({
    required this.darkMode,
    required this.defaultTimer,
    required this.defaultShuffle,
    required this.isLoaded,
  });

  final bool darkMode;
  final bool defaultTimer;
  final bool defaultShuffle;
  final bool isLoaded;

  SettingsData copyWith({
    bool? darkMode,
    bool? defaultTimer,
    bool? defaultShuffle,
    bool? isLoaded,
  }) {
    return SettingsData(
      darkMode: darkMode ?? this.darkMode,
      defaultTimer: defaultTimer ?? this.defaultTimer,
      defaultShuffle: defaultShuffle ?? this.defaultShuffle,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }

  factory SettingsData.initial() {
    return const SettingsData(
      darkMode: false,
      defaultTimer: true,
      defaultShuffle: true,
      isLoaded: false,
    );
  }
}
