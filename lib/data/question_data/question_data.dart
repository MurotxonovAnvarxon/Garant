class QuestionData {
  final String question;
  final Map<String, String> options;
  final String answer;
    String selectedAnswer="";

  QuestionData(
      {required this.question,
      required this.options,
      required this.answer,
      required this.selectedAnswer});
}

List<QuestionData> questionList = [];
