import 'package:elevate_online_exams/domain/model/questions_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'answers_dto.dart';
import 'exam_dto.dart';

part 'questions_dto.g.dart';

@JsonSerializable()
class QuestionsDTO {
  @JsonKey(name: "answers")
  final List<AnswersDTO>? answers;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "question")
  final String? question;
  @JsonKey(name: "correct")
  final String? correct;
  @JsonKey(name: "subject")
  final dynamic? subject;
  @JsonKey(name: "questions")
  final ExamDTO? exam;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  QuestionsDTO({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  factory QuestionsDTO.fromJson(Map<String, dynamic> json) {
    return _$QuestionsDTOFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuestionsDTOToJson(this);
  }

  QuestionsModel toQuestionsModel() {
    return QuestionsModel(
      answers: answers?.map((answer) => answer.toAnswersModel()).toList(),
      type: type,
      id: id,
      question: question,
      correct: correct,
      subject: subject,
      exam: exam?.toExamModel(),
      createdAt: createdAt,
    );
  }
}
