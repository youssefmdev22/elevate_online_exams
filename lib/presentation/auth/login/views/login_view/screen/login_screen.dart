import 'package:elevate_online_exams/core/di/di.dart';
import 'package:elevate_online_exams/core/route_generator/routes.dart';
import 'package:elevate_online_exams/presentation/auth/login/view_models/login_view_model/login_states.dart';
import 'package:elevate_online_exams/presentation/auth/login/view_models/login_view_model/login_view_model.dart';
import 'package:elevate_online_exams/presentation/auth/login/views/login_view/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../generated/l10n.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginViewModel loginViewModel = getIt.get<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginState>(
      bloc: loginViewModel,
      listener: (context, state) {
        if (state is LoginStateSuccess) {
          Navigator.of(context).maybePop();
          // SharedPrefs.saveData(Constants.tokenKey, state.loginModel.token);
          Navigator.pushReplacementNamed(context, Routes.homeScreen);
        } else if (state is LoginStateFailure) {
          Navigator.of(context).pop();
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(AppLocalizations.of(context).loginFailed),
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
        body: SafeArea(child: LoginViewBody(loginViewModel: loginViewModel)),
      ),
    );
  }
}
