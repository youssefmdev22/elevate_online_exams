import 'package:elevate_online_exams/api/model/saved_user_credentials_model.dart';
import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/login_model.dart';
import 'package:elevate_online_exams/domain/model/request_model/login_request_model.dart';
import 'package:elevate_online_exams/domain/usecase/load_saved_user_credentials_use_case.dart';
import 'package:elevate_online_exams/domain/usecase/login_use_case.dart';
import 'package:elevate_online_exams/presentation/auth/login/view_models/login_view_model/login_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  final LoadSavedUserCredentialsUseCase _loadSavedUserCredentialsUseCase;
  LoginViewModel(this._loginUseCase, this._loadSavedUserCredentialsUseCase)
    : super(LoginStateInital());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  Future<SavedUserCredentialsModel> loadSavedUserCredentials() async {
    var result = await _loadSavedUserCredentialsUseCase.call();
    if (result.isRemembered) {
      emailController.text = result.email ?? "";
      passwordController.text = result.password ?? "";
    }
    return result;
  }

  Future<void> login(bool isCheckedRememberMe) async {
    if (formKey.currentState!.validate()) {
      emit(LoginStateLoading());

      var result = await _loginUseCase.call(
        LoginRequestModel(
          email: emailController.text,
          password: passwordController.text,
        ),
        isCheckedRememberMe: isCheckedRememberMe,
      );
      switch (result) {
        case ApiSuccessResult<LoginModel>():
          emit(LoginStateSuccess(loginModel: result.data));
        case ApiErrorResult<LoginModel>():
          emit(LoginStateFailure(errorMessage: result.errorMessage));
      }
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
