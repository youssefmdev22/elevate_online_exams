import 'package:elevate_online_exams/domain/model/login_model.dart';

import '../login_dto.dart';

class LoginMapper {
  static LoginModel fromDto(LoginDto dto, String token) {
    return LoginModel(
      id: dto.id,
      username: dto.username,
      firstName: dto.firstName,
      lastName: dto.lastName,
      email: dto.email,
      phone: dto.phone,
      role: dto.role,
      isVerified: dto.isVerified,
      createdAt: dto.createdAt,
      token: token,
    );
  }
}
