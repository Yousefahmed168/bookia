class FaqModel {
  final int id;
  final String question;
  final String answer;

  FaqModel({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      question: json['question']?.toString() ?? '',
      answer: json['answer']?.toString() ?? '',
    );
  }
}