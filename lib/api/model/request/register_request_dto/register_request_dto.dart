import 'package:elevate_online_exams/domain/model/request_model/register_request_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request_dto.g.dart';

@JsonSerializable()
class RegisterRequestDto {
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "rePassword")
  final String? rePassword;
  @JsonKey(name: "phone")
  final String? phone;

  RegisterRequestDto({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  factory RegisterRequestDto.fromJson(Map<String, dynamic> json) {
    return _$RegisterRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegisterRequestDtoToJson(this);
  }

  factory RegisterRequestDto.fromDomain(
    RegisterRequestModel registerRequestModel,
  ) {
    return RegisterRequestDto(
      username: registerRequestModel.username,
      firstName: registerRequestModel.firstName,
      lastName: registerRequestModel.lastName,
      email: registerRequestModel.email,
      password: registerRequestModel.password,
      rePassword: registerRequestModel.rePassword,
      phone: registerRequestModel.phone
    );
  }
}
