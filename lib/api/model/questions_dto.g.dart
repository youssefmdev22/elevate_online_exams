// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionsDTO _$QuestionsDTOFromJson(Map<String, dynamic> json) => QuestionsDTO(
  answers:
      (json['answers'] as List<dynamic>?)
          ?.map((e) => AnswersDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
  type: json['type'] as String?,
  id: json['_id'] as String?,
  question: json['question'] as String?,
  correct: json['correct'] as String?,
  subject: json['subject'],
  exam:
      json['questions'] == null
          ? null
          : ExamDTO.fromJson(json['questions'] as Map<String, dynamic>),
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$QuestionsDTOToJson(QuestionsDTO instance) =>
    <String, dynamic>{
      'answers': instance.answers,
      'type': instance.type,
      '_id': instance.id,
      'question': instance.question,
      'correct': instance.correct,
      'subject': instance.subject,
      'questions': instance.exam,
      'createdAt': instance.createdAt,
    };
