import 'package:elevate_online_exams/core/route_generator/routes.dart';
import 'package:elevate_online_exams/domain/model/exam_model.dart';
import 'package:elevate_online_exams/presentation/auth/login/views/login_view/screen/login_screen.dart';
import 'package:elevate_online_exams/presentation/auth/register/views/register_view/screen/register_screen.dart';
import 'package:elevate_online_exams/presentation/exam/views/screen/exam_screen.dart';
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
        return MaterialPageRoute(builder: (_) => Container());
      case Routes.examScreen:
        //final examModel = settings.arguments as ExamModel;
        return MaterialPageRoute(
          builder:
              (_) => ExamScreen(
                examModel: ExamModel(
                  id: "670070a830a3c3c1944a9c63",
                  duration: 1,
                ),
              ),
        );
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
