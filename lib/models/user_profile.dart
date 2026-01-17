class UserProfile {
  UserProfile({required this.answers});

  final Map<String, String> answers;

  Map<String, dynamic> toMap() => {
        'answers': answers,
      };

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      answers: Map<String, String>.from(map['answers'] as Map? ?? {}),
    );
  }
}
