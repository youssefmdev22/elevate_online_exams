import 'package:elevate_online_exams/api/model/register_dto.dart';
import 'package:elevate_online_exams/domain/model/register_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('test toRegisterModel', () {
    test(
      'when call toRegisterModel with null values it should return registerModel with null values',
      () {
        RegisterDTO registerDTO = RegisterDTO(
          username: null,
          firstName: null,
          lastName: null,
          email: null,
          phone: null,
          role: null,
          isVerified: null,
          id: null,
          createdAt: null,
        );
        RegisterModel result = registerDTO.toRegisterModel();
        expect(result.username, equals(null));
        expect(result.firstName, equals(null));
        expect(result.lastName, equals(null));
        expect(result.email, equals(null));
        expect(result.phone, equals(null));
        expect(result.role, equals(null));
        expect(result.isVerified, equals(null));
        expect(result.id, equals(null));
        expect(result.createdAt, equals(null));
      },
    );
    test(
      "when call toRegisterModel with non-null values it should return registerModel with right values",
      () {
        RegisterDTO registerDTO = RegisterDTO(
          username: "fake-username",
          firstName: "fake-firstName",
          lastName: "fake-lastName",
          email: "fake-email",
          phone: "fake-phone",
          role: "fake-role",
          isVerified: true,
          id: "fake-id",
          createdAt: "fake",
        );
        RegisterModel result = registerDTO.toRegisterModel();
        expect(result.username, equals(registerDTO.username));
        expect(result.firstName, equals(registerDTO.firstName));
        expect(result.lastName, equals(registerDTO.lastName));
        expect(result.email, equals(registerDTO.email));
        expect(result.phone, equals(registerDTO.phone));
        expect(result.role, equals(registerDTO.role));
        expect(result.isVerified, equals(registerDTO.isVerified));
        expect(result.id, equals(registerDTO.id));
        expect(result.createdAt, equals(registerDTO.createdAt));  
      },
    );
  });
}
