class QuizQuestion {
  QuizQuestion({
    required this.id,
    required this.question,
    required this.choices,
    required this.correctIndex,
    required this.correctAnswer,
  });

  final String id;
  final String question;
  final List<String> choices;
  final int correctIndex;
  final String correctAnswer;

  Map<String, dynamic> toMap() => {
        'id': id,
        'question': question,
        'choices': choices,
        'correctIndex': correctIndex,
        'correctAnswer': correctAnswer,
      };

  factory QuizQuestion.fromMap(Map<String, dynamic> map) {
    return QuizQuestion(
      id: map['id'] as String,
      question: map['question'] as String,
      choices: List<String>.from(map['choices'] as List),
      correctIndex: map['correctIndex'] as int,
      correctAnswer: map['correctAnswer'] as String,
    );
  }
}

class Quiz {
  Quiz({
    required this.id,
    required this.title,
    required this.forWho,
    required this.tone,
    required this.questionCount,
    required this.createdAt,
    required this.questions,
  });

  final String id;
  final String title;
  final String forWho;
  final String tone;
  final int questionCount;
  final DateTime createdAt;
  final List<QuizQuestion> questions;

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'forWho': forWho,
        'tone': tone,
        'questionCount': questionCount,
        'createdAt': createdAt.toIso8601String(),
        'questions': questions.map((q) => q.toMap()).toList(),
      };

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      id: map['id'] as String,
      title: map['title'] as String,
      forWho: map['forWho'] as String,
      tone: map['tone'] as String,
      questionCount: map['questionCount'] as int,
      createdAt: DateTime.parse(map['createdAt'] as String),
      questions: (map['questions'] as List)
          .map((q) => QuizQuestion.fromMap(Map<String, dynamic>.from(q as Map)))
          .toList(),
    );
  }
}
