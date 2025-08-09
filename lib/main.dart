import 'package:elevate_online_exams/core/app/constants.dart';
import 'package:elevate_online_exams/core/resources/app_theme.dart';
import 'package:elevate_online_exams/core/route_generator/route_generator.dart';
import 'package:elevate_online_exams/core/route_generator/routes.dart';
import 'package:elevate_online_exams/domain/adapter/answers_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'core/app/shared_prefs.dart';
import 'core/bloc/app_bloc_observer.dart';
import 'core/di/di.dart';
import 'domain/adapter/exam_adapter.dart';
import 'domain/adapter/questions_adapter.dart';
import 'domain/adapter/result_adapter.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = AppBlocObserver();

  String? myToken = await SharedPrefs.getData(Constants.tokenKey);

  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(AnswersAdapter());
  Hive.registerAdapter(ExamAdapter());
  Hive.registerAdapter(QuestionsAdapter());
  Hive.registerAdapter(ResultAdapter());

  runApp(MyApp(myToken: myToken));
}

class MyApp extends StatelessWidget {
  final String? myToken;

  const MyApp({super.key, required this.myToken});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute:
              myToken == null ? Routes.loginScreen : Routes.homeScreen,
          home: child,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.delegate.supportedLocales,
          locale: const Locale("en"),
        );
      },
    );
  }
}
