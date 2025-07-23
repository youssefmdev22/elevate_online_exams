import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/subject_model.dart';
import 'package:elevate_online_exams/domain/usecase/subject_use_case.dart';
import 'package:elevate_online_exams/presentation/home/views/pages/explore_page/view_models/subject_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubjectViewModel extends Cubit<SubjectState> {
  final SubjectUseCase _subjectUseCase;
  SubjectViewModel(this._subjectUseCase) : super(SubjectStateInitial());

  Future<void> getAllSubjects() async {
    emit(SubjectStateLoading());
    var result = await _subjectUseCase.call();
    switch(result){
      case ApiSuccessResult<List<SubjectModel>>():
        emit(SubjectStateSuccess(subjects: result.data));
      case ApiErrorResult<List<SubjectModel>>():
        emit(SubjectStateFailure(errorMessage: result.errorMessage));
    }
  }
}
