import 'package:elevate_online_exams/domain/model/subject_exams_model.dart';
import 'package:equatable/equatable.dart';

sealed class SubjectExamsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubjectExamsStateInitial extends SubjectExamsState {
  
}

class SubjectExamsStateLoading extends SubjectExamsState {}

class SubjectExamsStateSuccess extends SubjectExamsState {
  final List<SubjectExamsModel> subjectExams;
  SubjectExamsStateSuccess({required this.subjectExams});
  @override
  List<Object?> get props => [subjectExams];
}

class SubjectExamsStateFailure extends SubjectExamsState {
  final String errorMessage;
  SubjectExamsStateFailure({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
