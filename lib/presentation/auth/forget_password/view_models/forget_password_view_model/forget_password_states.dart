import 'package:elevate_online_exams/domain/model/forget_password_model.dart';

sealed class ForgetPasswordState {}

class ForgetPasswordStateInital extends ForgetPasswordState {}

class ForgetPasswordStateLoading extends ForgetPasswordState {}

class ForgetPasswordStateSuccess extends ForgetPasswordState {
  final ForgetPasswordModel forgetPasswordModel;
  ForgetPasswordStateSuccess({required this.forgetPasswordModel});
}

class ForgetPasswordStatesFailure extends ForgetPasswordState {
  final String errorMessage;
  ForgetPasswordStatesFailure({required this.errorMessage});
}

