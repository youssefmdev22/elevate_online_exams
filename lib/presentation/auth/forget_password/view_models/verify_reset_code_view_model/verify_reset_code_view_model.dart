import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/forget_password_model.dart';
import 'package:elevate_online_exams/domain/model/request_model/forget_password_request_model.dart';
import 'package:elevate_online_exams/domain/model/request_model/verify_reset_code_request_model.dart';
import 'package:elevate_online_exams/domain/model/verify_reset_code_model.dart';
import 'package:elevate_online_exams/domain/usecase/forget_password_use_case.dart';
import 'package:elevate_online_exams/domain/usecase/verify_reset_code_use_case.dart';
import 'package:elevate_online_exams/presentation/auth/forget_password/view_models/verify_reset_code_view_model/verify_reset_code_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyResetCodeViewModel extends Cubit<VerifyResetCodeState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;
  VerifyResetCodeViewModel(
    this._forgetPasswordUseCase,
    this._verifyResetCodeUseCase,
  ) : super(VerifyResetCodeStateInital());

  final TextEditingController resetCodeController = TextEditingController();

  Future<void> verifyResetCode() async {
    emit(VerifyResetCodeStateLoading());
    var result = await _verifyResetCodeUseCase.call(
      VerifyResetCodeRequestModel(resetCode: resetCodeController.text),
    );
    switch (result) {
      case ApiSuccessResult<VerifyResetCodeModel>():
        emit(VerifyResetCodeStateSuccess(verifyResetCodeModel: result.data));
      case ApiErrorResult<VerifyResetCodeModel>():
        emit(VerifyResetCodeStateFailure(errorMessage: result.errorMessage));
    }
  }

  Future<void> resendResetCode(String email) async {
    emit(VerifyResetCodeStateLoading());
    var result = await _forgetPasswordUseCase.call(
      ForgetPasswordRequestModel(email: email),
    );
    switch (result) {
      case ApiSuccessResult<ForgetPasswordModel>():
        emit(VerifyResetCodeStateResnsendSuccess());
      case ApiErrorResult<ForgetPasswordModel>():
        emit(VerifyResetCodeStateFailure(errorMessage: result.errorMessage));
    }
  }

  @override
  Future<void> close() {
    resetCodeController.dispose();
    return super.close();
  }
}
