import 'package:dio/dio.dart';
import 'package:elevate_online_exams/api/model/request/change_password_request_dto/change_password_request_dto.dart';
import 'package:elevate_online_exams/api/model/request/edit_profile_request_dto/edit_profile_request_dto.dart';
import 'package:elevate_online_exams/api/model/request/forget_password_request_dto/forget_password_request_dto.dart';
import 'package:elevate_online_exams/api/model/request/login_request_dto/login_request_dto.dart';
import 'package:elevate_online_exams/api/model/request/reset_password_request_dto/reset_password_request_dto.dart';
import 'package:elevate_online_exams/api/model/request/verify_reset_code_request_dto/verify_reset_code_request_dto.dart';
import 'package:elevate_online_exams/api/model/response/change_password_response/change_password_response_dto.dart';
import 'package:elevate_online_exams/api/model/response/edit_profile_response/edit_profile_response.dart';
import 'package:elevate_online_exams/api/model/response/forget_password_response/forget_password_response_dto.dart';
import 'package:elevate_online_exams/api/model/response/login_response.dart';
import 'package:elevate_online_exams/api/model/response/questions/check_questions_response.dart';
import 'package:elevate_online_exams/api/model/response/register_response.dart';
import 'package:elevate_online_exams/api/model/response/reset_password_response/reset_password_response_dto.dart';
import 'package:elevate_online_exams/api/model/response/subject_exams_response/subject_exams_response.dart';
import 'package:elevate_online_exams/api/model/response/subject_response/subject_response.dart';
import 'package:elevate_online_exams/api/model/response/verify_reset_code_response/verify_reset_code_response_dto.dart';
import 'package:elevate_online_exams/core/app/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../model/request/questions/questions_request_model.dart';
import '../model/request/register_request_dto/register_request_dto.dart';
import '../model/response/questions/questions_response.dart';

part 'web_services.g.dart';

@RestApi()
abstract class WebServices {
  @factoryMethod
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @POST("api/v1/auth/signup")
  Future<RegisterResponse> register(
    @Body() RegisterRequestDto registerRequestDto,
  );

  @GET(EndPoints.questions)
  Future<QuestionsResponse> getExamQuestionsById(@Query('exam') String examId);

  @POST(EndPoints.checkQuestions)
  Future<CheckQuestionsResponse> checkExamQuestions(
    @Body() QuestionsRequestModel questionsRequestModel,
  );

  @POST(EndPoints.login)
  Future<LoginResponse> login(@Body() LoginRequestDto loginRequestDto);

  @GET(EndPoints.subjects)
  Future<SubjectResponse> getAllSubjects();

  @GET(EndPoints.subjectExams)
  Future<SubjectExamsResponse> getAllSubjectExams(
    @Query('subject') String subjectId,
  );

  @GET(EndPoints.getProfileData)
  Future<EditProfileResponse> getProfileData();

  @PUT(EndPoints.editProfile)
  Future<EditProfileResponse> editProfile(
    @Body() EditProfileRequestDto editProfileRequestDto,
  );

  @PATCH(EndPoints.changePassword)
  Future<ChangePasswordResponseDto> changePassword(
    @Body() ChangePasswordRequestDto changePasswordRequestDto,
  );

  @POST(EndPoints.forgetPassword)
  Future<ForgetPasswordResponseDto> forgetPassword(
    @Body() ForgetPasswordRequestDto forgetPasswordRequestDto,
  );

  @POST(EndPoints.verifyResetCode)
  Future<VerifyResetCodeResponseDto> verifyResetCode(
    @Body() VerifyResetCodeRequestDto verifyResetCodeRequestDto,
  );

  @PUT(EndPoints.resetPassword)
  Future<ResetPasswordResponseDto> resetPassword(
    @Body() ResetPasswordRequestDto resetPasswordRequestDto,
  );
}
