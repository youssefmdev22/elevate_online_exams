import '../../domain/model/register_model.dart';

abstract class AuthOnlineDataSource {
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
