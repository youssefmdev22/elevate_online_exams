import 'package:elevate_online_exams/domain/model/subject_exams_model.dart';

sealed class SubjectExamsState {}

class SubjectExamsStateInitial extends SubjectExamsState {}

class SubjectExamsStateLoading extends SubjectExamsState {}

class SubjectExamsStateSuccess extends SubjectExamsState {
  final List<SubjectExamsModel> subjectExams;
  SubjectExamsStateSuccess({required this.subjectExams});
}

class SubjectExamsStateFailure extends SubjectExamsState {
  final String errorMessage;
  SubjectExamsStateFailure({required this.errorMessage});
}
