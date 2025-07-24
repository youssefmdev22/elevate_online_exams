import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/data/datasource/subject_exams_remote_data_source.dart';
import 'package:elevate_online_exams/domain/model/subject_exams_model.dart';
import 'package:elevate_online_exams/domain/repos/subject_exams_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubjectExamsRepo)
class SubjectExamsRepoImpl implements SubjectExamsRepo{
  final SubjectExamsRemoteDataSource _subjectExamsRemoteDataSource;
  SubjectExamsRepoImpl(this._subjectExamsRemoteDataSource);

  @override
  Future<ApiResult<List<SubjectExamsModel>>> getAllSubjectExams(String subjectId) {
    return _subjectExamsRemoteDataSource.getAllSubjectExams(subjectId);
  }
}