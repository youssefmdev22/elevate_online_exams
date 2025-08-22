// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answers_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswersRequestModel _$AnswersRequestModelFromJson(Map<String, dynamic> json) =>
    AnswersRequestModel(
      questionId: json['questionId'] as String?,
      correct: json['correct'] as String?,
    );

Map<String, dynamic> _$AnswersRequestModelToJson(
  AnswersRequestModel instance,
) => <String, dynamic>{
  'questionId': instance.questionId,
  'correct': instance.correct,
};
