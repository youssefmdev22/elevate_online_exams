import 'package:elevate_online_exams/domain/model/login_model.dart';

sealed class LoginState {}

class LoginStateInital extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateSuccess extends LoginState {
  LoginModel loginModel;
  LoginStateSuccess({required this.loginModel});
}

class LoginStateFailure extends LoginState {
  String errorMessage;
  LoginStateFailure({required this.errorMessage});
}
