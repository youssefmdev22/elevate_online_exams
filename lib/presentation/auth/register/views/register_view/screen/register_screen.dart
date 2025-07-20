import 'package:elevate_online_exams/core/app/app_validators.dart';
import 'package:elevate_online_exams/core/custom_widget/custom_dialog.dart';
import 'package:elevate_online_exams/core/di/di.dart';
import 'package:elevate_online_exams/core/resources/font_manager.dart';
import 'package:elevate_online_exams/core/resources/style_manager.dart';
import 'package:elevate_online_exams/l10n/get_translations.dart';
import 'package:elevate_online_exams/presentation/auth/register/view_models/register_view_model/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/app_colors.dart';
import '../../../../../../core/route_generator/routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final RegisterViewModel _registerViewModel;
  bool _isButtonEnabled = true;
  bool _isDialogOpen = false;

  @override
  void initState() {
    super.initState();
    _registerViewModel = getIt<RegisterViewModel>();
  }

  @override
  void dispose() {
    _registerViewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterState>(
      bloc: _registerViewModel,
      listener: (context, state) {
        switch (state) {
          case RegisterInitial():
            break;
          case RegisterLoading():
            _isDialogOpen = true;
            CustomDialog.loading(context: context);
            break;
          case RegisterSuccess():
            if (_isDialogOpen) {
              Navigator.of(context).pop();
              _isDialogOpen = false;
            }
            CustomDialog.positiveButton(
              context: context,
              cancelable: false,
              title: getTranslations(context).success,
              message: getTranslations(context).accountCreatedSuccessfully,
              positiveOnClick: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.loginScreen,
                  (route) => false,
                );
              },
            );
            break;
          case RegisterError():
            if (_isDialogOpen) {
              Navigator.of(context).pop();
              _isDialogOpen = false;
            }
            CustomDialog.positiveButton(
              context: context,
              title: getTranslations(context).error,
              message: state.errorMessage,
            );
            break;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text(getTranslations(context).register),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Form(
              key: _registerViewModel.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 24.h,
                children: [
                  buildTextFormField(
                    controller: _registerViewModel.usernameController,
                    label: getTranslations(context).userName,
                    hint: getTranslations(context).enterUserName,
                    validator: AppValidators.validateUsername,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    spacing: 16.w,
                    children: [
                      Expanded(
                        child: buildTextFormField(
                          controller: _registerViewModel.firstNameController,
                          label: getTranslations(context).firstName,
                          hint: getTranslations(context).enterFirstName,
                          validator: AppValidators.validateFullName,
                        ),
                      ),
                      Expanded(
                        child: buildTextFormField(
                          controller: _registerViewModel.lastNameController,
                          label: getTranslations(context).lastName,
                          hint: getTranslations(context).enterLastName,
                          validator: AppValidators.validateFullName,
                        ),
                      ),
                    ],
                  ),
                  buildTextFormField(
                    controller: _registerViewModel.emailController,
                    label: getTranslations(context).email,
                    hint: getTranslations(context).enterYourEmail,
                    validator: AppValidators.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    spacing: 16.w,
                    children: [
                      Expanded(
                        child: buildTextFormField(
                          obscureText: true,
                          controller: _registerViewModel.passwordController,
                          label: getTranslations(context).password,
                          hint: getTranslations(context).enterPassword,
                          validator: AppValidators.validatePassword,
                        ),
                      ),
                      Expanded(
                        child: buildTextFormField(
                          obscureText: true,
                          controller: _registerViewModel.rePasswordController,
                          label: getTranslations(context).confirmPassword,
                          hint: getTranslations(context).confirmPassword,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return getTranslations(
                                context,
                              ).passwordIsRequired;
                            }
                            if (text !=
                                _registerViewModel.passwordController.text) {
                              return getTranslations(
                                context,
                              ).passwordNotMatched;
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  buildTextFormField(
                    controller: _registerViewModel.phoneController,
                    label: getTranslations(context).phoneNumber,
                    hint: getTranslations(context).enterPhoneNumber,
                    validator: AppValidators.validatePhoneNumber,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                  ),
                  ElevatedButton(
                    onPressed:
                        _isButtonEnabled
                            ? () {
                              setState(() {
                                _isButtonEnabled = false;
                              });
                              _registerViewModel.register();
                            }
                            : null,
                    child: Text(
                      getTranslations(context).register,
                      style: getBoldStyle(
                        fontSize: FontSize.s16,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required String? Function(String?)? validator,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    bool obscureText = false,
  }) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(labelText: label, hintText: hint),
      validator: validator,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction ?? TextInputAction.next,
      style: getRegularStyle(),
      onChanged: (_) {
        setState(() {
          _isButtonEnabled = true;
        });
      },
    );
  }
}
