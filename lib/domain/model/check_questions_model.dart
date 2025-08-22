import 'package:elevate_online_exams/domain/model/correct_questions_model.dart';
import 'package:elevate_online_exams/domain/model/wrong_questions_model.dart';

class CheckQuestionsModel{
  final String? message;
  final int? correct;
  final int? wrong;
  final String? total;
  final List<WrongQuestionsModel>? wrongQuestions;
  final List<CorrectQuestionsModel>? correctQuestions;

  CheckQuestionsModel({
    this.message,
    this.correct,
    this.wrong,
    this.total,
    this.wrongQuestions,
    this.correctQuestions,
  });
}