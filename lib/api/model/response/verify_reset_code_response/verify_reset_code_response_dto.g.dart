// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_reset_code_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyResetCodeResponseDto _$VerifyResetCodeResponseDtoFromJson(
  Map<String, dynamic> json,
) => VerifyResetCodeResponseDto(
  status: json['status'] as String?,
  message: json['message'] as String?,
  code: (json['code'] as num?)?.toInt(),
);

Map<String, dynamic> _$VerifyResetCodeResponseDtoToJson(
  VerifyResetCodeResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'code': instance.code,
};
