// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_exams_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectExamsResponse _$SubjectExamsResponseFromJson(
  Map<String, dynamic> json,
) => SubjectExamsResponse(
  message: json['message'] as String?,
  metadata:
      json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
  exams:
      (json['exams'] as List<dynamic>?)
          ?.map((e) => SubjectExamsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$SubjectExamsResponseToJson(
  SubjectExamsResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'metadata': instance.metadata,
  'exams': instance.exams,
};
