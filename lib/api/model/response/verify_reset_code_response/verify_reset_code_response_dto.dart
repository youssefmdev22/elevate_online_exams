import 'package:elevate_online_exams/domain/model/verify_reset_code_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_code_response_dto.g.dart';

@JsonSerializable()
class VerifyResetCodeResponseDto {
  String? status;
  String? message;
  int? code;

  VerifyResetCodeResponseDto({this.status, this.message, this.code});

  factory VerifyResetCodeResponseDto.fromJson(Map<String, dynamic> json) {
    return _$VerifyResetCodeResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VerifyResetCodeResponseDtoToJson(this);

  VerifyResetCodeModel toverifyResetCodeModel() {
    return VerifyResetCodeModel(
      status: status,
      message: message,
      code: code
    );
  }
}
