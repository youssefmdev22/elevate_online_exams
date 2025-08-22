import 'package:json_annotation/json_annotation.dart';

part 'subject_dto.g.dart';

@JsonSerializable()
class SubjectDto {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? icon;
  DateTime? createdAt;

  SubjectDto({this.id, this.name, this.icon, this.createdAt});

  factory SubjectDto.fromJson(Map<String, dynamic> json) {
    return _$SubjectDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubjectDtoToJson(this);
}
