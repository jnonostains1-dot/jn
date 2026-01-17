import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'models/quiz.dart';
import 'screens/create_quiz.dart';
import 'screens/home.dart';
import 'screens/profile.dart';
import 'screens/quiz_play.dart';
import 'screens/result.dart';
import 'screens/saved_quizzes.dart';
import 'services/storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.instance.init();
  runApp(const MeConnaisTuApp());
}

class MeConnaisTuApp extends StatelessWidget {
  const MeConnaisTuApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
        ),
        GoRoute(
          path: '/create',
          builder: (context, state) => const CreateQuizPage(),
        ),
        GoRoute(
          path: '/quiz',
          builder: (context, state) {
            final quiz = state.extra as Quiz;
            return QuizPlayPage(quiz: quiz);
          },
        ),
        GoRoute(
          path: '/result',
          builder: (context, state) {
            final args = state.extra as QuizResultArgs;
            return ResultPage(args: args);
          },
        ),
        GoRoute(
          path: '/saved',
          builder: (context, state) => const SavedQuizzesPage(),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Me Connais-Tu ?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
