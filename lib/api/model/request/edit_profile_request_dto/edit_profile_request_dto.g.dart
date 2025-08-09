// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileRequestDto _$EditProfileRequestDtoFromJson(
  Map<String, dynamic> json,
) => EditProfileRequestDto(
  username: json['username'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$EditProfileRequestDtoToJson(
  EditProfileRequestDto instance,
) => <String, dynamic>{
  'username': instance.username,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'phone': instance.phone,
};
