import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/forget_password_model.dart';
import 'package:elevate_online_exams/domain/model/request_model/forget_password_request_model.dart';
import 'package:elevate_online_exams/domain/usecase/forget_password_use_case.dart';
import 'package:elevate_online_exams/presentation/auth/forget_password/view_models/forget_password_view_model/forget_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  ForgetPasswordViewModel(
    this._forgetPasswordUseCase,
  ) : super(ForgetPasswordStateInital());

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController resetCodeController = TextEditingController();

  Future<void> forgetPassword() async {
    emit(ForgetPasswordStateLoading());
    var result = await _forgetPasswordUseCase.call(
      ForgetPasswordRequestModel(email: emailController.text),
    );
    switch (result) {
      case ApiSuccessResult<ForgetPasswordModel>():
        emit(ForgetPasswordStateSuccess(forgetPasswordModel: result.data));
      case ApiErrorResult<ForgetPasswordModel>():
        emit(ForgetPasswordStatesFailure(errorMessage: result.errorMessage));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
