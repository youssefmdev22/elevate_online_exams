import 'package:elevate_online_exams/domain/model/change_password_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password_response_dto.g.dart';

@JsonSerializable()
class ChangePasswordResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "code")
  final int? code;

  ChangePasswordResponseDto({this.message, this.token, this.code});

  factory ChangePasswordResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ChangePasswordResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ChangePasswordResponseDtoToJson(this);
  }

  ChangePasswordModel toChangePasswordModel() {
    return ChangePasswordModel(message: message, token: token, code: code);
  }
}
