import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/request_model/reset_password_request_model.dart';
import 'package:elevate_online_exams/domain/model/reset_password_model.dart';
import 'package:elevate_online_exams/domain/usecase/reset_password_use_case.dart';
import 'package:elevate_online_exams/presentation/auth/forget_password/view_models/reset_password_view_model/reset_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase _resetPasswordUseCase;
  ResetPasswordViewModel(this._resetPasswordUseCase)
    : super(ResetPasswordStateInitial());

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> resetPsswordFormKey = GlobalKey<FormState>();

  Future<void> resetPassword(String email) async {
    emit(ResetPasswordStateLoading());
    var result = await _resetPasswordUseCase.call(
      ResetPasswordRequestModel(
        email: email,
        newPassword: newPasswordController.text,
      ),
    );
    switch (result) {
      case ApiSuccessResult<ResetPasswordModel>():
        emit(ResetPasswordStateSuccess(resetPasswordModel: result.data));
      case ApiErrorResult<ResetPasswordModel>():
        emit(ResetPasswordStateFailure(errorMessage: result.errorMessage));
    }
  }
}
