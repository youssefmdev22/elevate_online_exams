import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterRequestModel {
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "rePassword")
  final String? rePassword;
  @JsonKey(name: "phone")
  final String? phone;

  RegisterRequestModel ({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return _$RegisterRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegisterRequestModelToJson(this);
  }
}


