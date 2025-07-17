import 'package:json_annotation/json_annotation.dart';

import '../login_dto.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? message;
  String? token;
  @JsonKey(name: 'user')
  LoginDto? user;

  LoginResponse({this.message, this.token, this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
