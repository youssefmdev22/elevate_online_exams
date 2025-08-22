import 'package:elevate_online_exams/domain/model/login_model.dart';

sealed class LoginState {}

class LoginStateInital extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateSuccess extends LoginState {
  final LoginModel loginModel;
  LoginStateSuccess({required this.loginModel});
}

class LoginStateFailure extends LoginState {
  final String errorMessage;
  LoginStateFailure({required this.errorMessage});
}
