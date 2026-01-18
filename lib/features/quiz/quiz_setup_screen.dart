import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_ai/app/app_router.dart';
import 'package:quiz_ai/features/quiz/quiz_controller.dart';
import 'package:quiz_ai/features/settings/settings_controller.dart';
import 'package:quiz_ai/models/category.dart';
import 'package:quiz_ai/models/difficulty.dart';
import 'package:quiz_ai/models/quiz_session.dart';
import 'package:quiz_ai/widgets/app_scaffold.dart';
import 'package:quiz_ai/widgets/primary_button.dart';

class QuizSetupScreen extends ConsumerStatefulWidget {
  const QuizSetupScreen({super.key, this.initialArgs});

  final QuizSetupArgs? initialArgs;

  @override
  ConsumerState<QuizSetupScreen> createState() => _QuizSetupScreenState();
}

class _QuizSetupScreenState extends ConsumerState<QuizSetupScreen> {
  late Category _selectedCategory;
  late Difficulty _selectedDifficulty;
  int _questionCount = 10;
  bool _timerEnabled = true;
  bool _shuffleAnswers = true;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _selectedCategory = Category.general;
    _selectedDifficulty = Difficulty.facile;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = widget.initialArgs;
    if (args != null) {
      _selectedCategory = CategoryInfo.fromKey(args.categoryKey);
      if (args.difficultyKey != null) {
        _selectedDifficulty = DifficultyInfo.fromKey(args.difficultyKey!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    if (!_initialized && settings.isLoaded) {
      _initialized = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _timerEnabled = settings.defaultTimer;
            _shuffleAnswers = settings.defaultShuffle;
          });
        }
      });
    }
    final repository = ref.read(questionRepositoryProvider);
    return AppScaffold(
      title: 'Lancer une partie',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _SectionTitle(title: 'Catégorie'),
          DropdownButtonFormField<Category>(
            value: _selectedCategory,
            items: Category.values
                .map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(category.label),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() => _selectedCategory = value);
              }
            },
          ),
          const SizedBox(height: 16),
          _SectionTitle(title: 'Difficulté'),
          DropdownButtonFormField<Difficulty>(
            value: _selectedDifficulty,
            items: Difficulty.values
                .map(
                  (difficulty) => DropdownMenuItem(
                    value: difficulty,
                    child: Text(difficulty.label),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() => _selectedDifficulty = value);
              }
            },
          ),
          const SizedBox(height: 16),
          _SectionTitle(title: 'Nombre de questions'),
          Wrap(
            spacing: 12,
            children: [5, 10, 15]
                .map(
                  (count) => ChoiceChip(
                    label: Text('$count'),
                    selected: _questionCount == count,
                    onSelected: (_) => setState(() => _questionCount = count),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 16),
          SwitchListTile.adaptive(
            value: _timerEnabled,
            title: const Text('Minuteur (15 s par question)'),
            onChanged: (value) => setState(() => _timerEnabled = value),
          ),
          SwitchListTile.adaptive(
            value: _shuffleAnswers,
            title: const Text('Mélanger les réponses'),
            onChanged: (value) => setState(() => _shuffleAnswers = value),
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            label: 'Commencer',
            icon: Icons.play_circle_fill_rounded,
            onPressed: () {
              final questions = repository.getQuestions(
                category: _selectedCategory,
                difficulty: _selectedDifficulty,
                count: _questionCount,
                shuffleAnswers: _shuffleAnswers,
              );
              if (questions.isEmpty || questions.length < _questionCount) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      questions.isEmpty
                          ? 'Aucune question disponible pour ce choix.'
                          : 'Seulement ${questions.length} questions disponibles. Choisissez un nombre inférieur.',
                    ),
                  ),
                );
                return;
              }
              final session = QuizSession(
                category: _selectedCategory,
                difficulty: _selectedDifficulty,
                questions: questions,
                timerEnabled: _timerEnabled,
                shuffleAnswers: _shuffleAnswers,
                questionsCount: _questionCount,
              );
              context.go('/quiz', extra: session);
            },
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
