import 'package:elevate_online_exams/domain/model/request_model/forget_password_request_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forget_password_request_dto.g.dart';

@JsonSerializable()
class ForgetPasswordRequestDto {
	String? email;

	ForgetPasswordRequestDto({this.email});

	factory ForgetPasswordRequestDto.fromJson(Map<String, dynamic> json) {
		return _$ForgetPasswordRequestDtoFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ForgetPasswordRequestDtoToJson(this);

  factory ForgetPasswordRequestDto.fromDomain(
    ForgetPasswordRequestModel forgetPasswordRequestModel
  ) {
    return ForgetPasswordRequestDto(
      email: forgetPasswordRequestModel.email
    );
  }
}
