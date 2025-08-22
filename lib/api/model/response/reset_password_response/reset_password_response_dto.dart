import 'package:elevate_online_exams/domain/model/reset_password_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_response_dto.g.dart';

@JsonSerializable()
class ResetPasswordResponseDto {
  String? message;
  String? token;
  String? code;

  ResetPasswordResponseDto({this.message, this.token, this.code});

  factory ResetPasswordResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResetPasswordResponseDtoToJson(this);

  ResetPasswordModel toResetPasswordModel() {
    return ResetPasswordModel(
      message: message,
      token: token,
      code: code,
    );
  }
}
