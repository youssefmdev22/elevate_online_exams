import 'package:elevate_online_exams/api/model/mapper/subject_mapper.dart';
import 'package:elevate_online_exams/api/web_services/web_services.dart';
import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/data/datasource/subject_remote_data_source.dart';
import 'package:elevate_online_exams/domain/model/subject_model.dart';
import 'package:elevate_online_exams/generated/l10n.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubjectRemoteDataSource)
class SubjectRemoteDataSourceImpl implements SubjectRemoteDataSource {
  final WebServices _webServices;

  const SubjectRemoteDataSourceImpl(this._webServices);

  @override
  Future<ApiResult<List<SubjectModel>>> getAllSubjects() async {

    List<SubjectModel> subjects = [];

    try {
      var response = await _webServices.getAllSubjects();
      if (response.subjects != null && response.subjects!.isNotEmpty) {
        subjects =
            response.subjects!
                .map((element) => SubjectMapper.fromDto(element))
                .toList();
        return ApiSuccessResult(subjects);
      } else {
        return ApiErrorResult(AppLocalizations().noSubjectsFound);
      }
    } catch (e) {
      return ApiErrorResult(e);
    }
  }
}
