import 'package:json_annotation/json_annotation.dart';
part 'answers_request_model.g.dart';

@JsonSerializable()
class AnswersRequestModel {
  @JsonKey(name: "questionId")
  final String? questionId;
  @JsonKey(name: "correct")
  final String? correct;

  AnswersRequestModel ({
    this.questionId,
    this.correct,
  });

  factory AnswersRequestModel.fromJson(Map<String, dynamic> json) {
    return _$AnswersRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AnswersRequestModelToJson(this);
  }
}