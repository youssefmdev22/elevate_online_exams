import '../../domain/model/result_model.dart';

abstract interface class QuestionsOfflineDataSource {
  Future<void> saveResult(ResultModel resultModel);
  Future<List<ResultModel>> getAllResults();
}