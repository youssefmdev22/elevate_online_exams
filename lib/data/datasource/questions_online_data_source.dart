import '../../api/model/request/questions/questions_request_model.dart';
import '../../core/api_result/api_result.dart';
import '../../domain/model/check_questions_model.dart';
import '../../domain/model/questions_model.dart';

abstract interface class QuestionsOnlineDataSource {
  Future<ApiResult<List<QuestionsModel>>> getAllExamQuestions(String examId);

  Future<ApiResult<CheckQuestionsModel>> checkExamQuestions(
    QuestionsRequestModel questionsRequestModel,
  );
}
