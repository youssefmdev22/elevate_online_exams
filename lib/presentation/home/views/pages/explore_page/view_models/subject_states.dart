import 'package:elevate_online_exams/domain/model/subject_model.dart';
import 'package:equatable/equatable.dart';

sealed class SubjectState extends Equatable {
   @override
  List<Object?> get props => [];
}

class SubjectStateInitial extends SubjectState {
  
}

class SubjectStateLoading extends SubjectState {}

class SubjectStateSuccess extends SubjectState {
  final List<SubjectModel> subjects;
  SubjectStateSuccess({required this.subjects});
  @override
  List<Object?> get props => [subjects];
}

class SubjectStateFailure extends SubjectState {
  final String errorMessage;
  SubjectStateFailure({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
