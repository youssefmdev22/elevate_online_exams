import 'package:elevate_online_exams/domain/model/answers_model.dart';

class WrongQuestionsModel {
  final String? QID;
  final String? question;
  final String? inCorrectAnswer;
  final String? correctAnswer;
  final List<AnswersModel>? answers;

  WrongQuestionsModel({
    this.QID,
    this.question,
    this.inCorrectAnswer,
    this.correctAnswer,
    this.answers,
  });
}
