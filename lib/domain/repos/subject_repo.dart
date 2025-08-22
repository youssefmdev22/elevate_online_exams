import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/subject_model.dart';

abstract interface class SubjectRepo {
  Future<ApiResult<List<SubjectModel>>> getAllSubjects();
}
