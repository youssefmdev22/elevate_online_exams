import 'package:elevate_online_exams/core/route_generator/routes.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => Container());
      case Routes.forgetScreen:
        return MaterialPageRoute(builder: (_) => Container());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => Container());
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
