import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/core/resources/style_manager.dart';
import 'package:elevate_online_exams/core/route_generator/routes.dart';
import 'package:elevate_online_exams/l10n/get_translations.dart';
import 'package:elevate_online_exams/presentation/auth/login/view_models/login_view_model/login_view_model.dart';
import 'package:elevate_online_exams/presentation/auth/login/views/login_view/widgets/custom_login_appbar.dart';
import 'package:elevate_online_exams/presentation/auth/login/views/login_view/widgets/login_form.dart';
import 'package:elevate_online_exams/presentation/auth/login/views/login_view/widgets/not_have_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/font_manager.dart';

class LoginViewBody extends StatefulWidget {
  final LoginViewModel loginViewModel;

  const LoginViewBody({super.key, required this.loginViewModel});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  void initState() {
    super.initState();
    widget.loginViewModel.loadSavedUserCredentials().then((result) {
      if (result.isRemembered) {
        setState(() {
          isCheckedRememberMe = true;
        });
        validateForm();
      }
    });
    widget.loginViewModel.emailController.addListener(validateForm);
    widget.loginViewModel.passwordController.addListener(validateForm);
  }

  @override
  void dispose() {
    widget.loginViewModel.emailController.removeListener(validateForm);
    widget.loginViewModel.passwordController.removeListener(validateForm);
    super.dispose();
  }

  void validateForm() {
    setState(() {
      isFormValid =
          widget.loginViewModel.formKey.currentState?.validate() ?? true;
    });
  }

  bool isCheckedRememberMe = false;
  bool isFormValid = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 8.h),
            const CustomLoginAppbar(),
            SizedBox(height: 24.h),
            LoginForm(loginViewModel: widget.loginViewModel),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(11),
                      child: SizedBox(
                        width: 18.w,
                        height: 18.h,
                        child: Checkbox(
                          fillColor: WidgetStateProperty.resolveWith<Color>((
                            Set<WidgetState> states,
                          ) {
                            return AppColors.lightGray;
                          }),
                          side: BorderSide(color: AppColors.gray),
                          checkColor: AppColors.gray,
                          value: isCheckedRememberMe,
                          onChanged: (value) {
                            isCheckedRememberMe = value!;
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    Text(
                      getTranslations(context).rememberMe,
                      style: getRegularStyle(fontSize: FontSize.s12),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.forgetScreen);
                  },
                  child: Text(
                    getTranslations(context).forgetPasswordQuestion,
                    style: getRegularStyle(
                      fontSize: FontSize.s12,
                    ).copyWith(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            SizedBox(height: 65.h),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isFormValid ? AppColors.blue : AppColors.gray,
                ),
                onPressed: () {
                  isFormValid
                      ? widget.loginViewModel.login(isCheckedRememberMe)
                      : null;
                },

                child: Text(
                  getTranslations(context).login,
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            const NotHaveAccountWidget(),
          ],
        ),
      ),
    );
  }
}
