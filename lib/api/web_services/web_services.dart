import 'package:dio/dio.dart';
import 'package:elevate_online_exams/api/model/request/login_request_model/login_request_model.dart';
import 'package:elevate_online_exams/api/model/response/questions/check_questions_response.dart';
import 'package:elevate_online_exams/api/model/response/login_response.dart';
import 'package:elevate_online_exams/api/model/response/register_response.dart';
import 'package:elevate_online_exams/core/app/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../model/request/questions/questions_request_model.dart';
import '../model/request/register_request_model.dart';
import '../model/response/questions/questions_response.dart';

part 'web_services.g.dart';

@RestApi()
abstract class WebServices {
  @factoryMethod
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @POST(EndPoints.register)
  Future<RegisterResponse> register(
    @Body() RegisterRequestModel registerRequestModel,
  );

  @POST(EndPoints.login)
  Future<LoginResponse> login(@Body() LoginRequestModel loginRequestModel);

  @GET(EndPoints.questions)
  Future<QuestionsResponse> getExamQuestionsById(@Query('exam') String examId);

  @POST(EndPoints.checkQuestions)
  Future<CheckQuestionsResponse> checkExamQuestions(
    @Body() QuestionsRequestModel questionsRequestModel,
  );
}
