import 'package:json_annotation/json_annotation.dart';

part 'subject_exams_dto.g.dart';

@JsonSerializable()
class SubjectExamsDto {
	@JsonKey(name: '_id') 
	String? id;
	String? title;
	int? duration;
	String? subject;
	int? numberOfQuestions;
	bool? active;
	DateTime? createdAt;

	SubjectExamsDto({
		this.id, 
		this.title, 
		this.duration, 
		this.subject, 
		this.numberOfQuestions, 
		this.active, 
		this.createdAt, 
	});

	factory SubjectExamsDto.fromJson(Map<String, dynamic> json) => _$SubjectExamsDtoFromJson(json);

	Map<String, dynamic> toJson() => _$SubjectExamsDtoToJson(this);
}
