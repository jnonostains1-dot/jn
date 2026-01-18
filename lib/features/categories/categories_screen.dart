import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_ai/app/app_router.dart';
import 'package:quiz_ai/models/category.dart';
import 'package:quiz_ai/models/difficulty.dart';
import 'package:quiz_ai/widgets/app_scaffold.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Catégories',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: Category.values.map((category) {
          return Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.label,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: Difficulty.values.map((difficulty) {
                      return OutlinedButton.icon(
                        onPressed: () {
                          context.go(
                            '/setup',
                            extra: QuizSetupArgs(
                              categoryKey: category.key,
                              difficultyKey: difficulty.key,
                            ),
                          );
                        },
                        icon: const Icon(Icons.play_arrow_rounded),
                        label: Text(difficulty.label),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
