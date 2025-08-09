import 'package:bloc_test/bloc_test.dart';
import 'package:elevate_online_exams/api/model/saved_user_credentials_model.dart';
import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/login_model.dart';
import 'package:elevate_online_exams/domain/model/request_model/login_request_model.dart';
import 'package:elevate_online_exams/domain/usecase/login_use_case.dart';
import 'package:elevate_online_exams/presentation/auth/login/view_models/login_view_model/login_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_online_exams/presentation/auth/login/view_models/login_view_model/login_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:elevate_online_exams/domain/usecase/load_saved_user_credentials_use_case.dart';
import 'package:mockito/mockito.dart';

import 'login_view_model_test.mocks.dart';

@GenerateMocks([LoginUseCase, LoadSavedUserCredentialsUseCase])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('login_view_model_test', () {
    late MockLoginUseCase mockedLoginUseCase;
    late MockLoadSavedUserCredentialsUseCase
    mockedLoadSavedUserCredentialsUseCase;

    var expectedModel = LoginModel(
      id: "fake-id",
      email: "test@gmail.com",
      username: "fake-user",
      firstName: "firstName",
      lastName: "lastName",
      phone: "01010101010",
      role: "admin",
      token: "fake-token",
      createdAt: DateTime.now(),
      isVerified: true,
    );
    var expectedResult = ApiSuccessResult(expectedModel);
    provideDummy<ApiResult<LoginModel>>(expectedResult);

    LoginRequestModel loginRequestModel = LoginRequestModel(
      email: "test@gmail.com",
      password: "Ba@12345",
    );

    setUp(() {
      mockedLoginUseCase = MockLoginUseCase();
      mockedLoadSavedUserCredentialsUseCase =
          MockLoadSavedUserCredentialsUseCase();
    });

    blocTest<LoginViewModel, LoginState>(
      'emits [LoginStateLoading , LoginStateSuccess] when login is successed.',
      build: () {
        when(
          mockedLoginUseCase.call(loginRequestModel, isCheckedRememberMe: true),
        ).thenAnswer((_) async => expectedResult);
        return LoginViewModel(
          mockedLoginUseCase,
          mockedLoadSavedUserCredentialsUseCase,
        );
      },
      act: (loginViewModel) {
        loginViewModel.emailController.text = "test@gmail.com";
        loginViewModel.passwordController.text = "Ba@12345";
        return loginViewModel.login(true);
      },
      expect:
          () => <LoginState>[
            LoginStateLoading(),
            LoginStateSuccess(loginModel: expectedModel),
          ],
      verify: (loginViewModel) {
        verify(
          mockedLoginUseCase.call(loginRequestModel, isCheckedRememberMe: true),
        ).called(1);
      },
    );

    blocTest<LoginViewModel, LoginState>(
      'emits [LoginStateLoading , LoginStateFailure] when login is failed.',
      build: () {
        when(
          mockedLoginUseCase.call(loginRequestModel, isCheckedRememberMe: true),
        ).thenAnswer((_) async => ApiErrorResult("Server Error"));
        return LoginViewModel(
          mockedLoginUseCase,
          mockedLoadSavedUserCredentialsUseCase,
        );
      },
      act: (loginViewModel) {
        loginViewModel.emailController.text = "test@gmail.com";
        loginViewModel.passwordController.text = "Ba@12345";
        return loginViewModel.login(true);
      },
      expect:
          () => <LoginState>[
            LoginStateLoading(),
            LoginStateFailure(errorMessage: "Server Error"),
          ],
      verify: (loginViewModel) {
        verify(
          mockedLoginUseCase.call(loginRequestModel, isCheckedRememberMe: true),
        ).called(1);
      },
    );

    test(
      "loadSavedUserCredentials sets email/password when isRemembered is true",
      () async {
        //Arrange
        LoginViewModel loginViewModel = LoginViewModel(
          mockedLoginUseCase,
          mockedLoadSavedUserCredentialsUseCase,
        );
        var expectedResult = SavedUserCredentialsModel(
          isRemembered: true,
          email: "test@gmail.com",
          password: "Ba@12345",
        );
        when(
          mockedLoadSavedUserCredentialsUseCase.call(),
        ).thenAnswer((_) async => expectedResult);
        //Act
        var result = await loginViewModel.loadSavedUserCredentials();
        //Assert
        verify(mockedLoadSavedUserCredentialsUseCase.call()).called(1);
        expect(result, expectedResult);
        expect(loginViewModel.emailController.text, "test@gmail.com");
        expect(loginViewModel.passwordController.text, "Ba@12345");
      },
    );

    test(
      "loadSavedUserCredentials doesn't sets email/password when isRemembered is false",
      () async {
        //Arrange
        LoginViewModel loginViewModel = LoginViewModel(
          mockedLoginUseCase,
          mockedLoadSavedUserCredentialsUseCase,
        );
        var expectedResult = SavedUserCredentialsModel(
          isRemembered: false,
          email: "test@gmail.com",
          password: "Ba@12345",
        );
        when(
          mockedLoadSavedUserCredentialsUseCase.call(),
        ).thenAnswer((_) async => expectedResult);
        //Act
        var result = await loginViewModel.loadSavedUserCredentials();
        //Assert
        verify(mockedLoadSavedUserCredentialsUseCase.call()).called(1);
        expect(result, expectedResult);
        expect(loginViewModel.emailController.text, ""); // should not be set
        expect(loginViewModel.passwordController.text, "");
      },
    );
  });
}
