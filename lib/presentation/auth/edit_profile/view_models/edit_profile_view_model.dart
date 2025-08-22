import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/request_model/edit_profile_request_model.dart';
import 'package:elevate_online_exams/domain/model/user_model.dart';
import 'package:elevate_online_exams/domain/usecase/edit_profile_use_case.dart';
import 'package:elevate_online_exams/domain/usecase/get_profile_data_use_case.dart';
import 'package:elevate_online_exams/presentation/auth/edit_profile/view_models/edit_profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileViewModel extends Cubit<EditProfileState> {
  final GetProfileDataUseCase _getProfileDataUseCase;
  final EditProfileUseCase _editProfileUseCase;
  EditProfileViewModel(this._getProfileDataUseCase, this._editProfileUseCase)
    : super(EditProfileStateInital());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  Future<void> getProfileData() async {
    emit(EditProfileStateLoading());
    var result = await _getProfileDataUseCase.call();
    switch (result) {
      case ApiSuccessResult<UserModel>():
        emit(EditProfileStateSuccess(userModel: result.data));
        userNameController.text = result.data.username!;
        firstNameController.text = result.data.firstName!;
        lastNameController.text = result.data.lastName!;
        emailController.text = result.data.email!;
        phoneNumberController.text = result.data.phone!;
      case ApiErrorResult<UserModel>():
        emit(EditProfileStateFailure(errorMessage: result.errorMessage));
    }
  }

  Future<void> editProfile() async {
    if (formKey.currentState!.validate()) {
      var result = await _editProfileUseCase.call(
        EditProfileRequestModel(
          username: userNameController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          phone: phoneNumberController.text,
        ),
      );
      switch (result) {
        case ApiSuccessResult<UserModel>():
          emit(EditProfileStateSuccessStatus());
          emit(EditProfileStateSuccess(userModel: result.data));
        case ApiErrorResult<UserModel>():
          emit(EditProfileStateFailure(errorMessage: result.errorMessage));
      }
    }
  }

  @override
  Future<void> close() {
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    return super.close();
  }
}
