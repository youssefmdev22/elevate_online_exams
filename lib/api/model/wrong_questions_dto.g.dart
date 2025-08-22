// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wrong_questions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WrongQuestionsDTO _$WrongQuestionsDTOFromJson(Map<String, dynamic> json) =>
    WrongQuestionsDTO(
      QID: json['QID'] as String?,
      Question: json['Question'] as String?,
      inCorrectAnswer: json['inCorrectAnswer'] as String?,
      correctAnswer: json['correctAnswer'] as String?,
    );

Map<String, dynamic> _$WrongQuestionsDTOToJson(WrongQuestionsDTO instance) =>
    <String, dynamic>{
      'QID': instance.QID,
      'Question': instance.Question,
      'inCorrectAnswer': instance.inCorrectAnswer,
      'correctAnswer': instance.correctAnswer,
    };
