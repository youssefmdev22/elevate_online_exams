import 'package:elevate_online_exams/domain/model/request_model/login_request_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request_dto.g.dart';

@JsonSerializable()
class LoginRequestDto {
  String? email;
  String? password;

  LoginRequestDto({this.email, this.password});

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) {
    return _$LoginRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginRequestDtoToJson(this);

  factory LoginRequestDto.fromDomain(LoginRequestModel loginRequestModel) {
    return LoginRequestDto(
      email: loginRequestModel.email,
      password: loginRequestModel.password
    );
  }
}
