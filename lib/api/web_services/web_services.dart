import 'package:elevate_online_exams/api/model/request/login_request_model/login_request_model.dart';
import 'package:elevate_online_exams/api/model/response/login_response.dart';
import 'package:elevate_online_exams/api/model/response/register_response.dart';
import 'package:elevate_online_exams/api/model/response/subject_exams_response/subject_exams_response.dart';
import 'package:elevate_online_exams/api/model/response/subject_response/subject_response.dart';
import 'package:elevate_online_exams/core/app/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/request/register_request_model.dart';

part 'web_services.g.dart';

@RestApi()
abstract class WebServices {
  @factoryMethod
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @POST("api/v1/auth/signup")
  Future<RegisterResponse> register(@Body() RegisterRequestModel registerRequestModel);

  @POST(EndPoints.login)
  Future<LoginResponse> login(@Body() LoginRequestModel loginRequestModel);

  @GET(EndPoints.subjects)
  Future<SubjectResponse> getAllSubjects();

  @GET(EndPoints.subjectExams)
  Future<SubjectExamsResponse> getAllSubjectExams(
    @Query('subject') String subjectId,
  );
}
