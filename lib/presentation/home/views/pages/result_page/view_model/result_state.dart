part of 'result_view_model.dart';

@immutable
sealed class ResultState {}

final class ResultInitial extends ResultState {}
final class ResultLoading extends ResultState {}
final class ResultSuccess extends ResultState {
  final List<ResultModel> resultList;
  ResultSuccess(this.resultList);
}
final class ResultError extends ResultState {
  final String errorMessage;
  ResultError(this.errorMessage);
}
