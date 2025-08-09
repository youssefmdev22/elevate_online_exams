import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/data/datasource/subject_remote_data_source.dart';
import 'package:elevate_online_exams/domain/model/subject_model.dart';
import 'package:elevate_online_exams/domain/repos/subject_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubjectRepo)
class SubjectRepoImpl implements SubjectRepo {
  final SubjectRemoteDataSource _subjectRemoteDataSource;
  const SubjectRepoImpl(this._subjectRemoteDataSource);

  @override
  Future<ApiResult<List<SubjectModel>>> getAllSubjects() {
    return _subjectRemoteDataSource.getAllSubjects();
  }
}
