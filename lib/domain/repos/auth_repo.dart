import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/login_model.dart';
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

  Future<ApiResult<LoginModel>> login(String email, String password);
}
