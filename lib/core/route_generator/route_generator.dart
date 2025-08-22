import 'package:elevate_online_exams/core/route_generator/routes.dart';
import 'package:elevate_online_exams/domain/model/questions_model.dart';
import 'package:elevate_online_exams/presentation/answers/views/screen/answers_screen.dart';
import 'package:elevate_online_exams/presentation/auth/change_password/views/screen/change_password_screen.dart';
import 'package:elevate_online_exams/presentation/auth/forget_password/views/screen/forget_password_screen.dart';
import 'package:elevate_online_exams/presentation/auth/forget_password/views/screen/reset_password_screen.dart';
import 'package:elevate_online_exams/presentation/auth/forget_password/views/screen/verify_reset_code_screen.dart';
import 'package:elevate_online_exams/presentation/auth/login/views/login_view/screen/login_screen.dart';
import 'package:elevate_online_exams/presentation/auth/register/views/register_view/screen/register_screen.dart';
import 'package:elevate_online_exams/presentation/home/views/screen/home_screen.dart';
import 'package:elevate_online_exams/presentation/subject_exams/views/screen/start_exam_screen.dart';
import 'package:elevate_online_exams/presentation/subject_exams/views/screen/subject_exams_screen.dart';
import 'package:flutter/material.dart';

import '../../domain/model/exam_model.dart';
import '../../presentation/exam/views/screen/exam_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.homeScreen:
        final navigateToResult = settings.arguments as bool? ?? false;
        return MaterialPageRoute(
          builder: (_) => HomeScreen(navigateToResult: navigateToResult),
        );
      case Routes.subjectExamsScreen:
        return MaterialPageRoute(
          builder: (_) => SubjectExamsScreen(),
          settings: settings,
        );
      case Routes.startExamScreen:
        return MaterialPageRoute(
          builder: (_) => StartExamScreen(),
          settings: settings,
        );
      case Routes.changePasswordScreen:
        return MaterialPageRoute(
          builder: (_) => ChangePasswordScreen(),
          settings: settings,
        );
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => ForgetPasswordScreen(),
          settings: settings,
        );
      case Routes.verifyResetCodeScreen:
        return MaterialPageRoute(
          builder: (_) => VerifyResetCodeScreen(),
          settings: settings,
        );
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => ResetPasswordScreen(),
          settings: settings,
        );
        return MaterialPageRoute(builder: (_) => Container());
      case Routes.examScreen:
        final examModel = settings.arguments as ExamModel;
        return MaterialPageRoute(
          builder: (_) => ExamScreen(examModel: examModel),
        );
      case Routes.answersScreen:
        final questionsList = settings.arguments as List<QuestionsModel>;
        return MaterialPageRoute(
          builder: (_) => AnswersScreen(questionsList: questionsList),
        );
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
