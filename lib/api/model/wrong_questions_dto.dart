import 'package:json_annotation/json_annotation.dart';

import 'answers_dto.dart';
part 'wrong_questions_dto.g.dart';

@JsonSerializable()
class WrongQuestionsDTO {
  @JsonKey(name: "QID")
  final String? QID;
  @JsonKey(name: "Question")
  final String? Question;
  @JsonKey(name: "inCorrectAnswer")
  final String? inCorrectAnswer;
  @JsonKey(name: "correctAnswer")
  final String? correctAnswer;
  /*@JsonKey(name: "answers")
  final List<AnswersDTO>? answers;*/

  WrongQuestionsDTO ({
    this.QID,
    this.Question,
    this.inCorrectAnswer,
    this.correctAnswer,
    //this.answers,
  });

  factory WrongQuestionsDTO.fromJson(Map<String, dynamic> json) {
    return _$WrongQuestionsDTOFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WrongQuestionsDTOToJson(this);
  }
}