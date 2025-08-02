import 'package:elevate_online_exams/domain/model/subject_model.dart';

sealed class SubjectState {}

class SubjectStateInitial extends SubjectState {}

class SubjectStateLoading extends SubjectState {}

class SubjectStateSuccess extends SubjectState {
  final List<SubjectModel> subjects;
  SubjectStateSuccess({required this.subjects});
}

class SubjectStateFailure extends SubjectState {
  final String errorMessage;
  SubjectStateFailure({required this.errorMessage});
}
