// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionsRequestModel _$QuestionsRequestModelFromJson(
  Map<String, dynamic> json,
) => QuestionsRequestModel(
  answers:
      (json['answers'] as List<dynamic>?)
          ?.map((e) => AnswersRequestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  time: (json['time'] as num?)?.toInt(),
);

Map<String, dynamic> _$QuestionsRequestModelToJson(
  QuestionsRequestModel instance,
) => <String, dynamic>{'answers': instance.answers, 'time': instance.time};
