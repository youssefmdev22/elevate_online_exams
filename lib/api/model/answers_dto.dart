import 'package:elevate_online_exams/domain/model/answers_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'answers_dto.g.dart';

@JsonSerializable()
class AnswersDTO {
  @JsonKey(name: "answer")
  final String? answer;
  @JsonKey(name: "key")
  final String? key;

  AnswersDTO ({
    this.answer,
    this.key,
  });

  factory AnswersDTO.fromJson(Map<String, dynamic> json) {
    return _$AnswersDTOFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AnswersDTOToJson(this);
  }

  AnswersModel toAnswersModel() {
    return AnswersModel(
      answer: answer,
      key: key,
    );
  }
}