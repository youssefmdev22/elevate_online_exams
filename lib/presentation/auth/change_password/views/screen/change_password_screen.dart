import 'package:elevate_online_exams/core/di/di.dart';
import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/core/resources/app_theme.dart';
import 'package:elevate_online_exams/core/route_generator/routes.dart';
import 'package:elevate_online_exams/generated/l10n.dart';
import 'package:elevate_online_exams/presentation/auth/change_password/view_models/change_password_states.dart';
import 'package:elevate_online_exams/presentation/auth/change_password/view_models/change_password_view_model.dart';
import 'package:elevate_online_exams/presentation/auth/change_password/views/widgets/change_password_form.dart';
import 'package:elevate_online_exams/presentation/auth/change_password/views/widgets/change_password_custam_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final ChangePasswordViewModel changePasswordViewModel =
      getIt.get<ChangePasswordViewModel>();

  bool isTextChanged = false;
  void isTextChangedFunction() {
    setState(() {
      isTextChanged = true;
    });
  }

  bool get isValid =>
      changePasswordViewModel.formKey.currentState?.validate() ?? false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordViewModel, ChangePasswordState>(
      bloc: changePasswordViewModel,
      listener: (context, state) {
        if (state is ChangePasswordStateSuccess) {
          Navigator.of(context).maybePop();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return AlertDialog(
                title: Text(
                  AppLocalizations.of(context).passwordChangedSuccessfully,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.maybePop(context);
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.loginScreen,
                        (route) => false,
                      );
                    },
                    child: Text(AppLocalizations.of(context).close),
                  ),
                ],
              );
            },
          );
        } else if (state is ChangePasswordStateFailure) {
          Navigator.of(context).pop();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return AlertDialog(
                title: Text(
                  AppLocalizations.of(context).failedToChangePassword,
                ),
                content: Text(state.errorMessage),
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
        } else {
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
                children: [
                  SizedBox(height: 32.h),
                  ChangePasswordCustamAppBar(),
                  SizedBox(height: 32.h),
                  ChangePasswordForm(
                    changePasswordViewModel: changePasswordViewModel,
                    isTextChangedFunction: isTextChangedFunction,
                  ),
                  SizedBox(height: 54.h),
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
                            ? changePasswordViewModel.changePassword()
                            : null;
                      },
                      child: Text(
                        AppLocalizations.of(context).update,
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
