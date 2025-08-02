import 'package:json_annotation/json_annotation.dart';

import 'metadata.dart';
import '../../subject_dto.dart';

part 'subject_response.g.dart';

@JsonSerializable()
class SubjectResponse {
  String? message;
  Metadata? metadata;
  List<SubjectDto>? subjects;

  SubjectResponse({this.message, this.metadata, this.subjects});

  factory SubjectResponse.fromJson(Map<String, dynamic> json) {
    return _$SubjectResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubjectResponseToJson(this);
}
