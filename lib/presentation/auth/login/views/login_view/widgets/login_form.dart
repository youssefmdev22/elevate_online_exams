import 'package:elevate_online_exams/core/resources/app_theme.dart';
import 'package:elevate_online_exams/core/app/app_validators.dart';
import 'package:elevate_online_exams/core/resources/style_manager.dart';
import 'package:elevate_online_exams/l10n/get_translations.dart';
import 'package:elevate_online_exams/presentation/auth/login/view_models/login_view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatelessWidget {
  final LoginViewModel loginViewModel;
  const LoginForm({super.key, required this.loginViewModel});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginViewModel.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: loginViewModel.emailController,
            style: getRegularStyle(),
            validator: AppValidators.validateEmail,
            decoration: InputDecoration(
              labelText: getTranslations(context).email,
              hintText: getTranslations(context).enterYourEmail,
            ),
          ),
          SizedBox(height: 24.h),
          TextFormField(
            controller: loginViewModel.passwordController,
            obscureText: true,
            style: getRegularStyle(),
            validator: AppValidators.validatePassword,
            decoration: InputDecoration(
              labelText: getTranslations(context).password,
              hintText: getTranslations(context).enterYourPassword,
            ),
          ),
        ],
      ),
    );
  }
}
