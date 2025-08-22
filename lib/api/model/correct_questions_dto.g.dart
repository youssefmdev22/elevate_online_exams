// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'correct_questions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CorrectQuestionsDTO _$CorrectQuestionsDTOFromJson(Map<String, dynamic> json) =>
    CorrectQuestionsDTO(
      QID: json['QID'] as String?,
      Question: json['Question'] as String?,
      correctAnswer: json['correctAnswer'] as String?,
    );

Map<String, dynamic> _$CorrectQuestionsDTOToJson(
  CorrectQuestionsDTO instance,
) => <String, dynamic>{
  'QID': instance.QID,
  'Question': instance.Question,
  'correctAnswer': instance.correctAnswer,
};
