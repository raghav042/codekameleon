class QuizModel {
  const QuizModel({
    required this.question,
    required this.answer,
    required this.options,
  });
  final String question;
  final int answer;
  final List<String> options;
}
