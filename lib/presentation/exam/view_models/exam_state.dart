part of 'exam_view_model.dart';

@immutable
sealed class ExamState {}

final class ExamInitial extends ExamState {}

final class ExamLoading extends ExamState {}

final class ExamSuccess extends ExamState {
  final List<QuestionsModel> questionsList;

  ExamSuccess(this.questionsList);
}

final class ExamError extends ExamState {
  final String errorMessage;

  ExamError(this.errorMessage);
}

final class ExamCheckQuestions extends ExamState {
  final CheckQuestionsModel checkQuestionsData;

  ExamCheckQuestions(this.checkQuestionsData);
}

final class ExamTimeout extends ExamState {}
