import 'package:elevate_online_exams/core/di/di.dart';
import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/core/resources/app_theme.dart';
import 'package:elevate_online_exams/core/route_generator/routes.dart';
import 'package:elevate_online_exams/generated/l10n.dart';
import 'package:elevate_online_exams/presentation/auth/forget_password/view_models/forget_password_view_model/forget_password_states.dart';
import 'package:elevate_online_exams/presentation/auth/forget_password/view_models/forget_password_view_model/forget_password_view_model.dart';
import 'package:elevate_online_exams/presentation/auth/forget_password/views/widgets/forget_password_form.dart';
import 'package:elevate_online_exams/presentation/auth/forget_password/views/widgets/reset_password_custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final ForgetPasswordViewModel forgetPasswordViewModel =
      getIt.get<ForgetPasswordViewModel>();

  bool isTextChanged = false;
  void isTextChangedFunction() {
    setState(() {
      isTextChanged = true;
    });
  }

  bool get isValid =>
      forgetPasswordViewModel.forgetPasswordFormKey.currentState?.validate() ??
      false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordViewModel, ForgetPasswordState>(
      bloc: forgetPasswordViewModel,
      listener: (context, state) {
        if (state is ForgetPasswordStateSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return AlertDialog(
                title: Center(child: Text(AppLocalizations.of(context).otp)),
                content: Text(
                  AppLocalizations.of(context).checkYourEmail,
                  textAlign: TextAlign.center,
                  style: AppTheme.getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () async {
                      Navigator.maybePop(context);
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.verifyResetCodeScreen,
                        arguments: forgetPasswordViewModel.emailController.text
                      );
                    },
                    child: Text(AppLocalizations.of(context).close),
                  ),
                ],
              );
            },
          );
        } else if (state is ForgetPasswordStatesFailure) {
          Navigator.of(context, rootNavigator: true).pop();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return AlertDialog(
                title: Text(AppLocalizations.of(context).emailNotValid),
                content: Text(
                  state.errorMessage,
                  textAlign: TextAlign.center,
                  style: AppTheme.getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.maybePop(context);
                    },
                    child: Text(AppLocalizations.of(context).close),
                  ),
                ],
              );
            },
          );
        } else if (state is ForgetPasswordStateLoading) {
          showDialog(
            context: context,
            builder: (_) {
              return Center(child: CircularProgressIndicator());
            },
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16.h),
                  ResetPasswordCustomAppBar(),
                  SizedBox(height: 40.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 34.w),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context).forgetPassword,
                            style: AppTheme.getTextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              AppLocalizations.of(
                                context,
                              ).pleaseEnterYourEmailAssociatedToYourAccount,
                              style: AppTheme.getTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.gray,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  ForgetPasswordForm(forgetPasswordViewModel: forgetPasswordViewModel, isTextChangedFunction: isTextChangedFunction),
                  SizedBox(height: 48.h),
                  SizedBox(
                    height: 48.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isTextChanged && isValid
                                ? AppColors.blue
                                : AppColors.gray,
                      ),
                      onPressed: () {
                        isTextChanged && isValid
                            ? forgetPasswordViewModel.forgetPassword()
                            : null;
                      },
                      child: Text(
                        AppLocalizations.of(context).continueKeyword,
                        style: AppTheme.getTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
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
}
