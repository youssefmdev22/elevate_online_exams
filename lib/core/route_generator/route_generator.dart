import 'package:elevate_online_exams/core/route_generator/routes.dart';
import 'package:elevate_online_exams/presentation/auth/login/views/login_view/screen/login_screen.dart';
import 'package:elevate_online_exams/presentation/auth/register/views/register_view/screen/register_screen.dart';
import 'package:elevate_online_exams/presentation/home/views/screen/home_screen.dart';
import 'package:elevate_online_exams/presentation/subject_exams/views/screen/start_exam_screen.dart';
import 'package:elevate_online_exams/presentation/subject_exams/views/screen/subject_exams_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.forgetScreen:
        return MaterialPageRoute(builder: (_) => Container());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
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
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
