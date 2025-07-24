import 'package:json_annotation/json_annotation.dart';

import '../../subject_exams_dto.dart';
import 'metadata.dart';

part 'subject_exams_response.g.dart';

@JsonSerializable()
class SubjectExamsResponse {
	String? message;
	Metadata? metadata;
	List<SubjectExamsDto>? exams;

	SubjectExamsResponse({this.message, this.metadata, this.exams});

	factory SubjectExamsResponse.fromJson(Map<String, dynamic> json) {
		return _$SubjectExamsResponseFromJson(json);
	}

	Map<String, dynamic> toJson() => _$SubjectExamsResponseToJson(this);
}
