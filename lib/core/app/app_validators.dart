import 'package:elevate_online_exams/generated/l10n.dart';

class AppValidators {
  AppValidators._();

  static String? validateEmail(String? val) {
    RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (val == null) {
      return AppLocalizations().emailIsRequired;
    } else if (val.trim().isEmpty) {
      return AppLocalizations().emailIsRequired;
    } else if (emailRegex.hasMatch(val) == false) {
      return AppLocalizations().enterValidEmail;
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    RegExp passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
    if (val == null) {
      return AppLocalizations().passwordIsRequired;
    } else if (val.isEmpty) {
      return AppLocalizations().passwordIsRequired;
    } else if (val.length < 8 || !passwordRegex.hasMatch(val)) {
      return AppLocalizations().passwordNotMatched;
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return AppLocalizations().passwordIsRequired;
    } else if (val != password) {
      return AppLocalizations().passwordNotMatched;
    } else {
      return null;
    }
  }

  static String? validateUsername(String? val) {
    RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (val == null) {
      return AppLocalizations().thisFieldIsRequired;
    } else if (val.isEmpty) {
      return AppLocalizations().thisFieldIsRequired;
    } else if (!usernameRegex.hasMatch(val)) {
      return AppLocalizations().enterValidUsername;
    } else {
      return null;
    }
  }

  static String? validateFullName(String? val) {
    if (val == null || val.isEmpty) {
      return AppLocalizations().thisFieldIsRequired;
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? val) {
    if (val == null) {
      return AppLocalizations().thisFieldIsRequired;
    } else if (int.tryParse(val.trim()) == null) {
      return AppLocalizations().enterNumbersOnly;
    } else if (val.trim().length != 11) {
      return AppLocalizations().enterValueMustEqual11Digit;
    } else {
      return null;
    }
  }
}
