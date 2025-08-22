import 'package:json_annotation/json_annotation.dart';

part 'correct_questions_dto.g.dart';

@JsonSerializable()
class CorrectQuestionsDTO {
  @JsonKey(name: "QID")
  final String? QID;
  @JsonKey(name: "Question")
  final String? Question;
  @JsonKey(name: "correctAnswer")
  final String? correctAnswer;
  /*@JsonKey(name: "answers")
  final List<AnswersDTO>? answers;*/

  CorrectQuestionsDTO ({
    this.QID,
    this.Question,
    this.correctAnswer,
    //this.answers,
  });

  factory CorrectQuestionsDTO.fromJson(Map<String, dynamic> json) {
    return _$CorrectQuestionsDTOFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CorrectQuestionsDTOToJson(this);
  }
}