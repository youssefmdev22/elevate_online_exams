import 'package:elevate_online_exams/domain/model/forget_password_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forget_password_response_dto.g.dart';

@JsonSerializable()
class ForgetPasswordResponseDto {
  String? message;
  String? info;
  String? code;

  ForgetPasswordResponseDto({this.message, this.info, this.code});

  factory ForgetPasswordResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ForgetPasswordResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ForgetPasswordResponseDtoToJson(this);

  ForgetPasswordModel toForgetPasswordModel() {
    return ForgetPasswordModel(
      message: message,
      info: info,
      code: code
    );
  }
}
