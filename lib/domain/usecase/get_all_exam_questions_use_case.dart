import 'package:injectable/injectable.dart';

import '../../core/api_result/api_result.dart';
import '../model/questions_model.dart';
import '../repos/questions_repo.dart';

@injectable
class GetAllExamQuestionsUseCase {
  final QuestionsRepo _questionsRepo;

  const GetAllExamQuestionsUseCase(this._questionsRepo);

  Future<ApiResult<List<QuestionsModel>>> call(String examId) async {
    return await _questionsRepo.getAllExamQuestions(examId);
  }
}
