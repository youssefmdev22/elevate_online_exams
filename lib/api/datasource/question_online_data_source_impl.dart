import 'package:elevate_online_exams/api/model/mapper/check_questions_mapper.dart';
import 'package:elevate_online_exams/api/model/request/questions/questions_request_model.dart';
import 'package:elevate_online_exams/api/web_services/web_services.dart';
import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/data/datasource/questions_online_data_source.dart';
import 'package:elevate_online_exams/domain/model/questions_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/check_questions_model.dart';

@Injectable(as: QuestionsOnlineDataSource)
class QuestionOnlineDataSourceImpl implements QuestionsOnlineDataSource {
  final WebServices _webServices;

  const QuestionOnlineDataSourceImpl(this._webServices);

  @override
  Future<ApiResult<List<QuestionsModel>>> getAllExamQuestions(
    String examId,
  ) async {
    try {
      final response = await _webServices.getExamQuestionsById(examId);
      return ApiSuccessResult(
        response.questions!
            .map((question) => question.toQuestionsModel())
            .toList(),
      );
    } catch (e) {
      return ApiErrorResult(e);
    }
  }

  @override
  Future<ApiResult<CheckQuestionsModel>> checkExamQuestions(
    QuestionsRequestModel questionsRequestModel,
  ) async {
    try {
      final response = await _webServices.checkExamQuestions(
        questionsRequestModel,
      );
      return ApiSuccessResult(
        CheckQuestionsMapper.fromResponse(checkQuestionsResponse: response),
      );
    } catch (e) {
      return ApiErrorResult(e);
    }
  }
}
