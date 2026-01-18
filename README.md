# Quiz AI

Application Flutter de quiz moderne en français, prête pour Windows et Web.

## Fonctionnalités
- Questions à choix multiples avec explication après chaque réponse.
- Score, bonus de vitesse, minuteur optionnel et écran de résultats.
- Catégories, difficultés, historique des parties et paramètres.
- Persistance locale via `shared_preferences`.
- UI Material 3 responsive (mobile, desktop, web).

## Lancer le projet
```bash
flutter pub get
flutter run -d windows
flutter run -d chrome
```

## Structure
- `lib/features/` : écrans et logique par fonctionnalité.
- `lib/models/` : modèles de données.
- `lib/services/` : repository de questions + stockage local.
- `lib/widgets/` : composants réutilisables.
