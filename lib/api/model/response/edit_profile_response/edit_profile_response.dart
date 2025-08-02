import 'package:json_annotation/json_annotation.dart';

import '../../user_dto.dart';

part 'edit_profile_response.g.dart';

@JsonSerializable()
class EditProfileResponse {
  String? message;
  UserDto? user;

  EditProfileResponse({this.message, this.user});

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) {
    return _$EditProfileResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EditProfileResponseToJson(this);
}
