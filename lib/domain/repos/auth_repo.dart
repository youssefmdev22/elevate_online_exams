import 'package:elevate_online_exams/domain/model/register_model.dart';

abstract class AuthRepo {
  Future<RegisterModel> register(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  );
}
