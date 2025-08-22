import 'package:elevate_online_exams/core/app/app_validators.dart';
import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/core/resources/app_theme.dart';
import 'package:elevate_online_exams/generated/l10n.dart';
import 'package:elevate_online_exams/presentation/auth/forget_password/view_models/reset_password_view_model/reset_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordForm extends StatelessWidget {
  final ResetPasswordViewModel resetPasswordViewModel;
  final VoidCallback isTextChangedFunction;
  const ResetPasswordForm({super.key, required this.resetPasswordViewModel, required this.isTextChangedFunction});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: resetPasswordViewModel.resetPsswordFormKey,
      onChanged: () {
        isTextChangedFunction();
      },
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          TextFormField(
            controller: resetPasswordViewModel.newPasswordController,
            validator: AppValidators.validatePassword,
            obscureText: true,
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).newPassword,
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
          SizedBox(height: 24.h),
          TextFormField(
            controller: resetPasswordViewModel.confirmPasswordController,
            validator:
                (val) => AppValidators.validateConfirmPassword(
                  val,
                  resetPasswordViewModel.newPasswordController.text,
                ),
            obscureText: true,
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).confirmPassword,
              labelStyle: AppTheme.getTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.gray,
              ),
              hintText: AppLocalizations.of(context).confirmPassword,
              hintStyle: AppTheme.getTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.gray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
