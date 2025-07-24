import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/subject_exams_model.dart';
import 'package:elevate_online_exams/domain/usecase/subject_exams_use_case.dart';
import 'package:elevate_online_exams/presentation/subject_exams/view_models/subject_exams_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubjectExamsViewModel extends Cubit<SubjectExamsState> {
  final SubjectExamsUseCase _subjectExamsUseCase;
  SubjectExamsViewModel(this._subjectExamsUseCase)
    : super(SubjectExamsStateInitial());

  Future<void> getAllSubjectExams(String subjectId) async {
    emit(SubjectExamsStateLoading());
    var result = await _subjectExamsUseCase.call(subjectId);
    switch (result) {
      case ApiSuccessResult<List<SubjectExamsModel>>():
        emit(SubjectExamsStateSuccess(subjectExams: result.data));
        break;
      case ApiErrorResult<List<SubjectExamsModel>>():
        emit(SubjectExamsStateFailure(errorMessage: result.errorMessage));
        break;
    }
  }
}
