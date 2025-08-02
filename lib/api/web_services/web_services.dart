import 'package:elevate_online_exams/api/model/request/change_password_request_dto/change_password_request_dto.dart';
import 'package:elevate_online_exams/api/model/request/edit_profile_request_dto/edit_profile_request_dto.dart';
import 'package:elevate_online_exams/api/model/request/login_request_dto/login_request_dto.dart';
import 'package:elevate_online_exams/api/model/response/change_password_response/change_password_response_dto.dart';
import 'package:elevate_online_exams/api/model/response/edit_profile_response/edit_profile_response.dart';
import 'package:elevate_online_exams/api/model/response/login_response.dart';
import 'package:elevate_online_exams/api/model/response/register_response.dart';
import 'package:elevate_online_exams/api/model/response/subject_exams_response/subject_exams_response.dart';
import 'package:elevate_online_exams/api/model/response/subject_response/subject_response.dart';
import 'package:elevate_online_exams/core/app/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/request/register_request_dto/register_request_dto.dart';

part 'web_services.g.dart';

@RestApi()
abstract class WebServices {
  @factoryMethod
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @POST("api/v1/auth/signup")
  Future<RegisterResponse> register(
    @Body() RegisterRequestDto registerRequestDto,
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
    @Body() ChangePasswordRequestDto changePasswordRequestDto ,
  );
}
