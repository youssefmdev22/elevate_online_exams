import 'package:elevate_online_exams/core/app/app_validators.dart';
import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/core/resources/app_theme.dart';
import 'package:elevate_online_exams/generated/l10n.dart';
import 'package:elevate_online_exams/presentation/auth/forget_password/view_models/forget_password_view_model/forget_password_view_model.dart';
import 'package:flutter/material.dart';

class ForgetPasswordForm extends StatelessWidget {
  final ForgetPasswordViewModel forgetPasswordViewModel;
  final VoidCallback isTextChangedFunction;
  const ForgetPasswordForm({super.key, required this.forgetPasswordViewModel, required this.isTextChangedFunction});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: forgetPasswordViewModel.forgetPasswordFormKey,
      onChanged: () {
        isTextChangedFunction();
      },
      autovalidateMode: AutovalidateMode.always,
      child: TextFormField(
        controller: forgetPasswordViewModel.emailController,
        validator: AppValidators.validateEmail,
        style: Theme.of(context).textTheme.bodySmall,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context).email,
          labelStyle: AppTheme.getTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.gray,
          ),
          hintText: AppLocalizations.of(context).enterEmail,
          hintStyle: AppTheme.getTextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.gray,
          ),
        ),
      ),
    );
  }
}
