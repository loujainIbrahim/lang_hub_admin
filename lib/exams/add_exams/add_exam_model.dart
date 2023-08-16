class QuestionModel {
  final String value;
  final String choise1;
  final String choise2;
  final String choise3;
  final int correctChoise;

  QuestionModel({
    required this.value,
    required this.choise1,
    required this.choise2,
    required this.choise3,
    required this.correctChoise,
  });

  Map<String, dynamic> toJson() {
    return {
      "value": value,
      "choise1": choise1,
      "choise2": choise2,
      "choise3": choise3,
      "correct_choise": correctChoise, // corrected key name
    };
  }
}

class ExamModel {
  final List<QuestionModel> questions;

  ExamModel({required this.questions});

  List<Map<String, dynamic>> toJson() {
    return questions.map((question) => question.toJson()).toList();
  }
}