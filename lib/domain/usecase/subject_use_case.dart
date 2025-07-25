import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/subject_model.dart';
import 'package:elevate_online_exams/domain/repos/subject_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubjectUseCase {
  final SubjectRepo _subjectRepo;

  const SubjectUseCase(this._subjectRepo);

  Future<ApiResult<List<SubjectModel>>> call(){
    return _subjectRepo.getAllSubjects();
  }
}