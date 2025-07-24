import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/subject_exams_model.dart';

abstract interface class SubjectExamsRemoteDataSource {
  Future<ApiResult<List<SubjectExamsModel>>> getAllSubjectExams(String subjectId);
}