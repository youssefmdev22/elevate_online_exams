import 'package:elevate_online_exams/domain/model/login_model.dart';
import 'package:equatable/equatable.dart';

sealed class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginStateInital extends LoginState {
}

class LoginStateLoading extends LoginState {}

class LoginStateSuccess extends LoginState {
  final LoginModel loginModel;
  LoginStateSuccess({required this.loginModel});
  @override
  List<Object?> get props => [loginModel];
}

class LoginStateFailure extends LoginState {
  final String errorMessage;
  LoginStateFailure({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
