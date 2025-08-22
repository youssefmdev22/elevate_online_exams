import 'answers_model.dart';
import 'exam_model.dart';

class QuestionsModel {
  final List<AnswersModel>? answers;
  final String? type;
  final String? id;
  final String? question;
  final String? correct;
  final dynamic? subject;
  final ExamModel? exam;
  final String? createdAt;
  int? selectedAnswer;

  QuestionsModel({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
    this.selectedAnswer,
  });
}
