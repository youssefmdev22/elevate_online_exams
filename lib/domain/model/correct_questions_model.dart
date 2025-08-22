import 'package:elevate_online_exams/domain/model/answers_model.dart';

class CorrectQuestionsModel {
  final String? QID;
  final String? question;
  final String? correctAnswer;
  final List<AnswersModel>? answers;

  CorrectQuestionsModel({
    this.QID,
    this.question,
    this.correctAnswer,
    this.answers,
  });
}
