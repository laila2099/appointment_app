class FAQ {
  final String question;
  final String answer;

  const FAQ({
    required this.question,
    required this.answer,
  });

  Map<String, String> toMap() {
    return {
      'q': question,
      'a': answer,
    };
  }

  factory FAQ.fromMap(Map<String, String> map) {
    return FAQ(
      question: map['q'] ?? '',
      answer: map['a'] ?? '',
    );
  }
}

