import 'package:elevate_online_exams/api/model/response/login_response.dart';
import 'package:elevate_online_exams/api/model/response/register_response.dart';
import 'package:elevate_online_exams/core/app/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'web_services.g.dart';

@RestApi()
abstract class WebServices {
  @factoryMethod
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @POST("api/v1/auth/signup")
  Future<RegisterResponse> register(@Body() Map<String, dynamic> body);

  @POST(EndPoints.login)
  Future<LoginResponse> login(@Body() Map<String, dynamic> body);
}
