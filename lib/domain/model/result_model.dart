import 'package:elevate_online_exams/domain/model/exam_model.dart';
import 'package:elevate_online_exams/domain/model/questions_model.dart';

class ResultModel {
  final ExamModel? examModel;
  final List<QuestionsModel>? questionsList;
  final int? correctAnswers;
  final int? examTime;

  ResultModel({
    required this.examModel,
    required this.questionsList,
    required this.correctAnswers,
    this.examTime,
  });
}
