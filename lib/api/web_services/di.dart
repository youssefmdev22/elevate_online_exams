import 'package:dio/dio.dart';
import 'package:elevate_online_exams/api/web_services/web_services.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../core/app/constants.dart';
import '../../core/app/shared_prefs.dart';

@module
abstract class NetworkModule {
  @singleton
  BaseOptions provideBaseOptions() {
    return BaseOptions(
      baseUrl: "https://exam.elevateegy.com/",
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
  }

  @singleton
  PrettyDioLogger providePrettyDioLogger() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    );
  }

  @singleton
  Dio provideDio(BaseOptions baseOptions, PrettyDioLogger prettyDioLogger) {
    Dio dio = Dio(baseOptions);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? token = await SharedPrefs.getData(Constants.tokenKey);
          if (token != null && token.isNotEmpty) {
            options.headers["token"] = token;
          }
          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(prettyDioLogger);
    return dio;
  }

  @singleton
  WebServices provideWebServices(Dio client) => WebServices(client);
}
