import 'package:elevate_online_exams/domain/model/request_model/change_password_request_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password_request_dto.g.dart';

@JsonSerializable()
class ChangePasswordRequestDto {
  String? oldPassword;
  String? password;
  String? rePassword;

  ChangePasswordRequestDto({this.oldPassword, this.password, this.rePassword});

  factory ChangePasswordRequestDto.fromJson(Map<String, dynamic> json) {
    return _$ChangePasswordRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChangePasswordRequestDtoToJson(this);

  factory ChangePasswordRequestDto.fromDomain(
    ChangePasswordRequestModel changePasswordRequestModel,
  ) {
    return ChangePasswordRequestDto(
      oldPassword: changePasswordRequestModel.oldPassword,
      password: changePasswordRequestModel.password,
      rePassword: changePasswordRequestModel.rePassword
    );
  }
}
