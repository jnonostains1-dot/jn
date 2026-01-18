enum Category {
  general,
  football,
  cinema,
  technologie,
  insolite,
}

extension CategoryInfo on Category {
  String get label {
    switch (this) {
      case Category.general:
        return 'Culture générale';
      case Category.football:
        return 'Football';
      case Category.cinema:
        return 'Cinéma / Séries';
      case Category.technologie:
        return 'Technologie';
      case Category.insolite:
        return 'Insolite';
    }
  }

  String get key {
    switch (this) {
      case Category.general:
        return 'general';
      case Category.football:
        return 'football';
      case Category.cinema:
        return 'cinema';
      case Category.technologie:
        return 'technologie';
      case Category.insolite:
        return 'insolite';
    }
  }

  static Category fromKey(String key) {
    return Category.values.firstWhere(
      (category) => category.key == key,
      orElse: () => Category.general,
    );
  }
}
