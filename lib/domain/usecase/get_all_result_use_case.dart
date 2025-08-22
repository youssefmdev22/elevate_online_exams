import 'package:injectable/injectable.dart';

import '../model/result_model.dart';
import '../repos/questions_repo.dart';

@injectable
class GetAllResultUseCase {
  final QuestionsRepo _questionsRepo;

  GetAllResultUseCase(this._questionsRepo);

  Future<List<ResultModel>> call() {
    return _questionsRepo.getAllResults();
  }
}
