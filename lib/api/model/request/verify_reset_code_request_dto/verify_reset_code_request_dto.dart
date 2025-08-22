import 'package:elevate_online_exams/domain/model/request_model/verify_reset_code_request_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_code_request_dto.g.dart';

@JsonSerializable()
class VerifyResetCodeRequestDto {
  String? resetCode;

  VerifyResetCodeRequestDto({this.resetCode});

  factory VerifyResetCodeRequestDto.fromJson(Map<String, dynamic> json) {
    return _$VerifyResetCodeRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VerifyResetCodeRequestDtoToJson(this);

  factory VerifyResetCodeRequestDto.fromDomain(
    VerifyResetCodeRequestModel verifyResetCodeRequestModel,
  ) {
    return VerifyResetCodeRequestDto(
      resetCode: verifyResetCodeRequestModel.resetCode
    );
  }
}
