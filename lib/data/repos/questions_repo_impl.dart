import 'package:elevate_online_exams/api/model/request/questions/questions_request_model.dart';
import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/data/datasource/questions_offline_data_source.dart';
import 'package:elevate_online_exams/domain/model/questions_model.dart';
import 'package:elevate_online_exams/domain/model/result_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/check_questions_model.dart';
import '../../domain/repos/questions_repo.dart';
import '../datasource/questions_online_data_source.dart';

@Injectable(as: QuestionsRepo)
class QuestionsRepoImpl implements QuestionsRepo {
  final QuestionsOnlineDataSource _questionsOnlineDataSource;
  final QuestionsOfflineDataSource _questionsOfflineDataSource;

  const QuestionsRepoImpl(
    this._questionsOnlineDataSource,
    this._questionsOfflineDataSource,
  );

  @override
  Future<ApiResult<List<QuestionsModel>>> getAllExamQuestions(String examId) {
    return _questionsOnlineDataSource.getAllExamQuestions(examId);
  }

  @override
  Future<ApiResult<CheckQuestionsModel>> checkExamQuestions(
    QuestionsRequestModel questionsRequestModel,
  ) {
    return _questionsOnlineDataSource.checkExamQuestions(questionsRequestModel);
  }

  @override
  Future<List<ResultModel>> getAllResults() {
    return _questionsOfflineDataSource.getAllResults();
  }

  @override
  Future<void> saveResult(ResultModel resultModel) {
    return _questionsOfflineDataSource.saveResult(resultModel);
  }
}
