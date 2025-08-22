import 'package:elevate_online_exams/domain/model/request_model/reset_password_request_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request_dto.g.dart';

@JsonSerializable()
class ResetPasswordRequestDto {
  String? email;
  String? newPassword;

  ResetPasswordRequestDto({this.email, this.newPassword});

  factory ResetPasswordRequestDto.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResetPasswordRequestDtoToJson(this);

  factory ResetPasswordRequestDto.fromDomain(
    ResetPasswordRequestModel resetPasswordRequestModel,
  ) {
    return ResetPasswordRequestDto(
      email: resetPasswordRequestModel.email,
      newPassword: resetPasswordRequestModel.newPassword
    );
  }
}
