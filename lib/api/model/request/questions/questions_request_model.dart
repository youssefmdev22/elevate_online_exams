import 'package:elevate_online_exams/api/model/request/questions/answers_request_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'questions_request_model.g.dart';

@JsonSerializable()
class QuestionsRequestModel {
  @JsonKey(name: "answers")
  final List<AnswersRequestModel>? answers;
  @JsonKey(name: "time")
  final int? time;

  QuestionsRequestModel ({
    this.answers,
    this.time,
  });

  factory QuestionsRequestModel.fromJson(Map<String, dynamic> json) {
    return _$QuestionsRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuestionsRequestModelToJson(this);
  }
}