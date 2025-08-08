import 'package:elevate_online_exams/domain/repos/questions_repo.dart';
import 'package:injectable/injectable.dart';

import '../../api/model/request/questions/questions_request_model.dart';
import '../../core/api_result/api_result.dart';
import '../model/check_questions_model.dart';

@injectable
class CheckExamQuestionsUseCase {
  final QuestionsRepo _questionsRepo;

  const CheckExamQuestionsUseCase(this._questionsRepo);

  Future<ApiResult<CheckQuestionsModel>> call(
    QuestionsRequestModel questionsRequestModel,
  ) async {
    return await _questionsRepo.checkExamQuestions(questionsRequestModel);
  }
}
