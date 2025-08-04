import 'package:elevate_online_exams/domain/model/reset_password_model.dart';

sealed class ResetPasswordState {}

class ResetPasswordStateInitial extends ResetPasswordState {}

class ResetPasswordStateLoading extends ResetPasswordState {}

class ResetPasswordStateSuccess extends ResetPasswordState {
  final ResetPasswordModel resetPasswordModel;
  ResetPasswordStateSuccess({required this.resetPasswordModel});
}

class ResetPasswordStateFailure extends ResetPasswordState {
  final String errorMessage;
  ResetPasswordStateFailure({required this.errorMessage});
}
