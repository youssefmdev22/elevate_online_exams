import 'package:elevate_online_exams/api/model/request/questions/questions_request_model.dart';
import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/check_questions_model.dart';
import 'package:elevate_online_exams/domain/model/result_model.dart';

import '../model/questions_model.dart';

abstract interface class QuestionsRepo {
  Future<ApiResult<List<QuestionsModel>>> getAllExamQuestions(String examId);

  Future<ApiResult<CheckQuestionsModel>> checkExamQuestions(
    QuestionsRequestModel questionsRequestModel,
  );

  Future<void> saveResult(ResultModel resultModel);

  Future<List<ResultModel>> getAllResults();
}
