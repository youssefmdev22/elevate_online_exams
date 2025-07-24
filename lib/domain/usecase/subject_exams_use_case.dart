import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/subject_exams_model.dart';
import 'package:elevate_online_exams/domain/repos/subject_exams_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubjectExamsUseCase {
  final SubjectExamsRepo _subjectExamsRepo;
  SubjectExamsUseCase(this._subjectExamsRepo);

  Future<ApiResult<List<SubjectExamsModel>>> call (String subjectId) {
    return _subjectExamsRepo.getAllSubjectExams(subjectId);
  }
}