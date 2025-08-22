import 'package:elevate_online_exams/core/app/app_validators.dart';
import 'package:elevate_online_exams/presentation/auth/login/view_models/login_view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../generated/l10n.dart';

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
            style: Theme.of(context).textTheme.bodySmall,
            validator: AppValidators.validateEmail,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).email,
              hintText: AppLocalizations.of(context).enterYourEmail,
            ),
          ),
          SizedBox(height: 24.h),
          TextFormField(
            controller: loginViewModel.passwordController,
            obscureText: true,
            style: Theme.of(context).textTheme.bodySmall,
            validator: AppValidators.validatePassword,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).password,
              hintText: AppLocalizations.of(context).enterYourPassword,
            ),
          ),
        ],
      ),
    );
  }
}
