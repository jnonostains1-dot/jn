import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_ai/features/categories/categories_screen.dart';
import 'package:quiz_ai/features/history/history_screen.dart';
import 'package:quiz_ai/features/home/home_screen.dart';
import 'package:quiz_ai/features/quiz/quiz_question_screen.dart';
import 'package:quiz_ai/features/quiz/quiz_result_screen.dart';
import 'package:quiz_ai/features/quiz/quiz_setup_screen.dart';
import 'package:quiz_ai/features/settings/settings_screen.dart';
import 'package:quiz_ai/models/quiz_result.dart';
import 'package:quiz_ai/models/quiz_session.dart';

GoRouter createRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/categories',
        builder: (context, state) => const CategoriesScreen(),
      ),
      GoRoute(
        path: '/history',
        builder: (context, state) => const HistoryScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/setup',
        builder: (context, state) {
          return QuizSetupScreen(
            initialArgs: state.extra as QuizSetupArgs?,
          );
        },
      ),
      GoRoute(
        path: '/quiz',
        builder: (context, state) {
          final session = state.extra as QuizSession?;
          if (session == null) {
            return const _MissingSession();
          }
          return QuizQuestionScreen(session: session);
        },
      ),
      GoRoute(
        path: '/result',
        builder: (context, state) {
          final result = state.extra as QuizResult?;
          if (result == null) {
            return const _MissingSession();
          }
          return QuizResultScreen(result: result);
        },
      ),
    ],
    errorBuilder: (context, state) => const _MissingSession(),
  );
}

class QuizSetupArgs {
  const QuizSetupArgs({required this.categoryKey, this.difficultyKey});

  final String categoryKey;
  final String? difficultyKey;
}

class _MissingSession extends StatelessWidget {
  const _MissingSession();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Aucune session active. Retournez à l’accueil.'),
      ),
    );
  }
}
