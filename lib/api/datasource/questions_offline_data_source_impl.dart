import 'package:elevate_online_exams/core/app/constants.dart';
import 'package:elevate_online_exams/data/datasource/questions_offline_data_source.dart';
import 'package:elevate_online_exams/domain/model/result_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: QuestionsOfflineDataSource)
class QuestionsOfflineDataSourceImpl implements QuestionsOfflineDataSource {
  @override
  Future<List<ResultModel>> getAllResults() async {
    final box = await Hive.openBox<ResultModel>(Constants.hiveBox);
    return box.values.toList();
  }

  @override
  Future<void> saveResult(ResultModel resultModel) async {
    final box = await Hive.openBox<ResultModel>(Constants.hiveBox);
    await box.add(resultModel);
  }
}
