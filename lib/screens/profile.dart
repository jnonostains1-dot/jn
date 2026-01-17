import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/profile_question.dart';
import '../services/storage_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final StorageService _storage = StorageService.instance;
  Map<String, String> _answers = {};

  @override
  void initState() {
    super.initState();
    _answers = _storage.getResponses();
  }

  Future<void> _answerQuestion(ProfileQuestion question) async {
    if (question.isText) {
      final controller = TextEditingController(text: _answers[question.id] ?? '');
      final response = await showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(question.question),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Ta réponse'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, controller.text.trim()),
              child: const Text('Enregistrer'),
            ),
          ],
        ),
      );
      if (response != null) {
        await _saveAnswer(question.id, response);
      }
    } else {
      final response = await showDialog<String>(
        context: context,
        builder: (context) => SimpleDialog(
          title: Text(question.question),
          children: question.options!
              .map(
                (option) => RadioListTile<String>(
                  value: option,
                  groupValue: _answers[question.id],
                  onChanged: (value) => Navigator.pop(context, value),
                  title: Text(option),
                ),
              )
              .toList(),
        ),
      );
      if (response != null) {
        await _saveAnswer(question.id, response);
      }
    }
  }

  Future<void> _saveAnswer(String id, String answer) async {
    setState(() {
      _answers = {..._answers, id: answer};
    });
    await _storage.saveResponse(id, answer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () => context.go('/'),
        ),
        title: const Text('Mon Profil'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: profileQuestions.length,
        itemBuilder: (context, index) {
          final question = profileQuestions[index];
          final answer = _answers[question.id];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(question.question),
              subtitle: Text(
                answer?.isNotEmpty == true ? 'Réponse : $answer' : 'Sans réponse',
              ),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => _answerQuestion(question),
              ),
            ),
          );
        },
      ),
    );
  }
}
