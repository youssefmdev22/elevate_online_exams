import 'package:elevate_online_exams/domain/model/change_password_model.dart';

sealed class ChangePasswordState {}

class ChangePasswordStateInital extends ChangePasswordState {}

class ChangePasswordStateLoading extends ChangePasswordState {}

class ChangePasswordStateSuccess extends ChangePasswordState {
  final ChangePasswordModel changePasswordModel;
  ChangePasswordStateSuccess({required this.changePasswordModel});
}

class ChangePasswordStateFailure extends ChangePasswordState {
  final String errorMessage;
  ChangePasswordStateFailure({required this.errorMessage});
}
