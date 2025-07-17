import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/core/app/constants.dart';
import 'package:elevate_online_exams/core/app/shared_prefs.dart';
import 'package:elevate_online_exams/domain/model/login_model.dart';
import 'package:elevate_online_exams/domain/usecase/login_use_case.dart';
import 'package:elevate_online_exams/presentation/view_models/login_view_model/login_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  LoginUseCase loginUseCase;
  LoginViewModel(this.loginUseCase) : super(LoginStateInital());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void login(bool isChecked) async {
    if (formKey.currentState!.validate()) {
      emit(LoginStateLoading());

      if (isChecked) {
        await SharedPrefs.saveData(Constants.rememberMe, true);
        await SharedPrefs.saveData(
          Constants.email,
          emailController.text,
        );
        await SharedPrefs.saveData(
          Constants.password,
          passwordController.text,
        );
      } else {
        await SharedPrefs.removeData(Constants.rememberMe);
        await SharedPrefs.removeData(Constants.email);
        await SharedPrefs.removeData(Constants.password);
      }
      
      var result = await loginUseCase.call(
        emailController.text,
        passwordController.text,
      );
      switch (result) {
        case ApiSuccessResult<LoginModel>():
          await SharedPrefs.saveData(Constants.tokenKey, result.data.token);
          emit(LoginStateSuccess(loginModel: result.data));
          SharedPrefs.saveData(Constants.tokenKey, result.data.token);
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
