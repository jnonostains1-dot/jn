enum Difficulty {
  facile,
  moyen,
  difficile,
}

extension DifficultyInfo on Difficulty {
  String get label {
    switch (this) {
      case Difficulty.facile:
        return 'Facile';
      case Difficulty.moyen:
        return 'Moyen';
      case Difficulty.difficile:
        return 'Difficile';
    }
  }

  String get key {
    switch (this) {
      case Difficulty.facile:
        return 'facile';
      case Difficulty.moyen:
        return 'moyen';
      case Difficulty.difficile:
        return 'difficile';
    }
  }

  static Difficulty fromKey(String key) {
    return Difficulty.values.firstWhere(
      (difficulty) => difficulty.key == key,
      orElse: () => Difficulty.facile,
    );
  }
}
