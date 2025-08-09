import 'package:elevate_online_exams/api/model/user_dto.dart';
import 'package:elevate_online_exams/domain/model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("test toUserModel", () {
    test(
      "when call toUserModel with null values it should return userModel with null values",
      () {
        UserDto userDto = UserDto(
          id: null,
          username: null,
          firstName: null,
          lastName: null,
          email: null,
          phone: null,
          role: null,
          password: null,
          isVerified: null,
          createdAt: null,
          passwordChangedAt: null,
        );
        UserModel result = userDto.toUserModel();
        expect(result.id, isNull);
        expect(result.username, isNull);
        expect(result.firstName, isNull);
        expect(result.lastName, isNull);
        expect(result.email, isNull);
        expect(result.phone, isNull);
        expect(result.role, isNull);
        expect(result.password, isNull);
        expect(result.isVerified, isNull);
        expect(result.createdAt, isNull);
        expect(result.passwordChangedAt, isNull);
      },
    );
    test(
      "when call toUserModel with non-null values it it should return userModel with right values",
      () {
        UserDto userDto = UserDto(
          id: "fake-id",
          username: "fake-username",
          firstName: "fake-firstName",
          lastName: "fake-lastName",
          email: "fake-email",
          phone: "fake-phone",
          role: "fake-role",
          password: "fake-password",
          isVerified: false,
          createdAt: DateTime(2024),
          passwordChangedAt: DateTime(2024),
        );
        UserModel result = userDto.toUserModel();
        expect(result.id, equals(userDto.id));
        expect(result.username, equals(userDto.username));
        expect(result.firstName, equals(userDto.firstName));
        expect(result.lastName, equals(userDto.lastName));
        expect(result.email, equals(userDto.email));
        expect(result.phone, equals(userDto.phone));
        expect(result.role, equals(userDto.role));
        expect(result.password, equals(userDto.password));
        expect(result.isVerified, equals(userDto.isVerified));
        expect(result.createdAt, equals(userDto.createdAt));
        expect(result.passwordChangedAt, equals(userDto.passwordChangedAt));
      },
    );
  });
}
