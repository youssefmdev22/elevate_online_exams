import 'package:elevate_online_exams/core/app/constants.dart';
import 'package:elevate_online_exams/core/app/shared_prefs.dart';
import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/core/resources/app_theme.dart';
import 'package:elevate_online_exams/core/route_generator/routes.dart';
import 'package:elevate_online_exams/l10n/get_translations.dart';
import 'package:elevate_online_exams/presentation/view_models/login_view_model/login_view_model.dart';
import 'package:elevate_online_exams/presentation/views/login_view/widgets/custom_login_appbar.dart';
import 'package:elevate_online_exams/presentation/views/login_view/widgets/login_form.dart';
import 'package:elevate_online_exams/presentation/views/login_view/widgets/not_have_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    loadRememberedData();
    widget.loginViewModel.emailController.addListener(validateForm);
    widget.loginViewModel.passwordController.addListener(validateForm);
  }

  @override
  void dispose() {
    widget.loginViewModel.emailController.removeListener(validateForm);
    widget.loginViewModel.passwordController.removeListener(validateForm);
    super.dispose();
  }

  void loadRememberedData() async {
    final rememberData =
        await SharedPrefs.getData(Constants.rememberMe) ?? false;
    if (rememberData == true) {
      final savedEmail = await SharedPrefs.getData(Constants.email);
      final savedPassword = await SharedPrefs.getData(Constants.password);
      setState(() {
        isChecked = true;
        widget.loginViewModel.emailController.text = savedEmail;
        widget.loginViewModel.passwordController.text = savedPassword;
      });
      validateForm();
    }
  }

  void validateForm() {
    setState(() {
      isFormValid =
          widget.loginViewModel.formKey.currentState?.validate() ?? true;
    });
  }

  bool isChecked = false;
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
                            return const Color(
                              0xFFF0F0F0,
                            ); // background color (checked and unchecked)
                          }),
                          side: BorderSide(color: AppColors.gray),
                          checkColor: AppColors.gray,
                          value: isChecked,
                          onChanged: (value) {
                            isChecked = value!;
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    Text(
                      getTranslations(context).rememberMe,
                      style: AppTheme.getInterTextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.forgetScreen);
                  },
                  child: Text(
                    getTranslations(context).forgetPasswordQuestion,
                    style: AppTheme.getInterTextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
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
                  isFormValid ?
                          widget.loginViewModel.login(isChecked)
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
