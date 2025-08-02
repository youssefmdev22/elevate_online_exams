import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/change_password_model.dart';
import 'package:elevate_online_exams/domain/model/request_model/change_password_request_model.dart';
import 'package:elevate_online_exams/domain/usecase/change_password_use_case.dart';
import 'package:elevate_online_exams/presentation/auth/change_password/view_models/change_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordViewModel extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase _changePasswordUseCase;
  ChangePasswordViewModel(this._changePasswordUseCase)
    : super(ChangePasswordStateInital());

  final TextEditingController currentPasswordController =
      TextEditingController();

  final TextEditingController newPasswordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> changePassword() async {
    if (formKey.currentState!.validate()) {
      emit(ChangePasswordStateLoading());
      var result = await _changePasswordUseCase.call(
        ChangePasswordRequestModel(
          oldPassword: currentPasswordController.text,
          password: newPasswordController.text,
          rePassword: confirmPasswordController.text,
        ),
      );
      switch (result) {
        case ApiSuccessResult<ChangePasswordModel>():
          emit(ChangePasswordStateSuccess(changePasswordModel: result.data));
        case ApiErrorResult<ChangePasswordModel>():
          emit(ChangePasswordStateFailure(errorMessage: result.errorMessage));
      }
    }
  }
}
