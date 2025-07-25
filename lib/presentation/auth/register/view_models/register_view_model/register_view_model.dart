import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../api/model/request/register_request_model.dart';
import '../../../../../core/api_result/api_result.dart';
import '../../../../../domain/model/register_model.dart';
import '../../../../../domain/usecase/register_use_case.dart';

part 'register_state.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterViewModel(this._registerUseCase) : super(RegisterInitial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoading());
      final response = await _registerUseCase(
        registerRequestModel: RegisterRequestModel(
          username: usernameController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          password: passwordController.text,
          rePassword: rePasswordController.text,
          phone: phoneController.text,
        ),
      );
      switch (response) {
        case ApiSuccessResult<RegisterModel>():
          return emit(RegisterSuccess());
        case ApiErrorResult<RegisterModel>():
          return emit(RegisterError(response.errorMessage));
      }
    }
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
