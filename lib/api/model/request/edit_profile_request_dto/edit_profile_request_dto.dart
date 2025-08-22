import 'package:elevate_online_exams/domain/model/request_model/edit_profile_request_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request_dto.g.dart';

@JsonSerializable()
class EditProfileRequestDto {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  EditProfileRequestDto({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  factory EditProfileRequestDto.fromJson(Map<String, dynamic> json) {
    return _$EditProfileRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EditProfileRequestDtoToJson(this);

  factory EditProfileRequestDto.fromDomain(
    EditProfileRequestModel editProfileRequestModel,
  ) {
    return EditProfileRequestDto(
      username: editProfileRequestModel.username,
      firstName: editProfileRequestModel.firstName,
      lastName: editProfileRequestModel.lastName,
      email: editProfileRequestModel.email,
      phone: editProfileRequestModel.phone,
    );
  }
}
