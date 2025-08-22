import 'package:elevate_online_exams/domain/repos/questions_repo.dart';
import 'package:injectable/injectable.dart';

import '../model/result_model.dart';

@injectable
class SaveResultUseCase {
  final QuestionsRepo _questionsRepo;

  SaveResultUseCase(this._questionsRepo);

  Future<void> call(ResultModel resultModel) {
    return _questionsRepo.saveResult(resultModel);
  }
}
