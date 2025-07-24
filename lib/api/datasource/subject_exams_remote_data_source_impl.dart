import 'package:elevate_online_exams/api/model/mapper/subject_exams_mapper.dart';
import 'package:elevate_online_exams/api/web_services/web_services.dart';
import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/data/datasource/subject_exams_remote_data_source.dart';
import 'package:elevate_online_exams/domain/model/subject_exams_model.dart';
import 'package:elevate_online_exams/generated/l10n.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubjectExamsRemoteDataSource)
class SubjectExamsRemoteDataSourceImpl implements SubjectExamsRemoteDataSource {
  final WebServices _webServices;
  SubjectExamsRemoteDataSourceImpl(this._webServices);

  @override
  Future<ApiResult<List<SubjectExamsModel>>> getAllSubjectExams(
    String subjectId,
  ) async {
    List<SubjectExamsModel> subjectExams = [];
    try {
      var response = await _webServices.getAllSubjectExams(subjectId);
      if (response.exams != null && response.exams!.isNotEmpty) {
        subjectExams = response.exams!
            .map((element) => SubjectExamsMapper.fromDto(element))
            .toList();
        return ApiSuccessResult(subjectExams);
      } else {
        return ApiErrorResult(AppLocalizations().noExamsFoundForThisSubject);
      }
    } catch (e) {
      return ApiErrorResult(e.toString());
    }
  }
}
