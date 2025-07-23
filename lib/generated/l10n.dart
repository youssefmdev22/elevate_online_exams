// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(
      _current != null,
      'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(
      instance != null,
      'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Online Exams`
  String get appName {
    return Intl.message('Online Exams', name: 'appName', desc: '', args: []);
  }

  /// `Reset password`
  String get resetPassword {
    return Intl.message(
      'Reset password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Current password`
  String get currentPassword {
    return Intl.message(
      'Current password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invalid password`
  String get invalidPassword {
    return Intl.message(
      'Invalid password',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password not matched`
  String get passwordNotMatched {
    return Intl.message(
      'Password not matched',
      name: 'passwordNotMatched',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `Edit profile`
  String get editProfile {
    return Intl.message(
      'Edit profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get userName {
    return Intl.message('User name', name: 'userName', desc: '', args: []);
  }

  /// `First name`
  String get firstName {
    return Intl.message('First name', name: 'firstName', desc: '', args: []);
  }

  /// `Last name`
  String get lastName {
    return Intl.message('Last name', name: 'lastName', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Change`
  String get change {
    return Intl.message('Change', name: 'change', desc: '', args: []);
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: '', args: []);
  }

  /// `Exam`
  String get exam {
    return Intl.message('Exam', name: 'exam', desc: '', args: []);
  }

  /// `Question X of X`
  String get questionXofX {
    return Intl.message(
      'Question X of X',
      name: 'questionXofX',
      desc: '',
      args: [],
    );
  }

  /// `Select the correctly punctuated sentence.`
  String get selectCorrectSentence {
    return Intl.message(
      'Select the correctly punctuated sentence.',
      name: 'selectCorrectSentence',
      desc: '',
      args: [],
    );
  }

  /// `Its going to rain today.`
  String get itsGoingToRain {
    return Intl.message(
      'Its going to rain today.',
      name: 'itsGoingToRain',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Finish`
  String get finish {
    return Intl.message('Finish', name: 'finish', desc: '', args: []);
  }

  /// `Time out !!`
  String get timeOut {
    return Intl.message('Time out !!', name: 'timeOut', desc: '', args: []);
  }

  /// `Exam score`
  String get examScore {
    return Intl.message('Exam score', name: 'examScore', desc: '', args: []);
  }

  /// `Your score`
  String get yourScore {
    return Intl.message('Your score', name: 'yourScore', desc: '', args: []);
  }

  /// `Correct`
  String get correct {
    return Intl.message('Correct', name: 'correct', desc: '', args: []);
  }

  /// `Incorrect`
  String get incorrect {
    return Intl.message('Incorrect', name: 'incorrect', desc: '', args: []);
  }

  /// `Show results`
  String get showResults {
    return Intl.message(
      'Show results',
      name: 'showResults',
      desc: '',
      args: [],
    );
  }

  /// `Start again`
  String get startAgain {
    return Intl.message('Start again', name: 'startAgain', desc: '', args: []);
  }

  /// `Languages`
  String get languages {
    return Intl.message('Languages', name: 'languages', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Spanish`
  String get spanish {
    return Intl.message('Spanish', name: 'spanish', desc: '', args: []);
  }

  /// `High level`
  String get highLevel {
    return Intl.message('High level', name: 'highLevel', desc: '', args: []);
  }

  /// `30 Minutes`
  String get thirtyMinutes {
    return Intl.message(
      '30 Minutes',
      name: 'thirtyMinutes',
      desc: '',
      args: [],
    );
  }

  /// `20 Question`
  String get twentyQuestions {
    return Intl.message(
      '20 Question',
      name: 'twentyQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Instructions`
  String get instructions {
    return Intl.message(
      'Instructions',
      name: 'instructions',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message('Start', name: 'start', desc: '', args: []);
  }

  /// `Answers`
  String get answers {
    return Intl.message('Answers', name: 'answers', desc: '', args: []);
  }

  /// `Results`
  String get results {
    return Intl.message('Results', name: 'results', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `18 corrected answers in 25 min.`
  String get correctedAnswersInfo {
    return Intl.message(
      '18 corrected answers in 25 min.',
      name: 'correctedAnswersInfo',
      desc: '',
      args: [],
    );
  }

  /// `Math`
  String get math {
    return Intl.message('Math', name: 'math', desc: '', args: []);
  }

  /// `Algebra`
  String get algebra {
    return Intl.message('Algebra', name: 'algebra', desc: '', args: []);
  }

  /// `Explore`
  String get explore {
    return Intl.message('Explore', name: 'explore', desc: '', args: []);
  }

  /// `Result`
  String get result {
    return Intl.message('Result', name: 'result', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Sign up`
  String get signUp {
    return Intl.message('Sign up', name: 'signUp', desc: '', args: []);
  }

  /// `Enter your user name`
  String get enterUserName {
    return Intl.message(
      'Enter your user name',
      name: 'enterUserName',
      desc: '',
      args: [],
    );
  }

  /// `Enter first name`
  String get enterFirstName {
    return Intl.message(
      'Enter first name',
      name: 'enterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Enter last name`
  String get enterLastName {
    return Intl.message(
      'Enter last name',
      name: 'enterLastName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Email`
  String get enterEmail {
    return Intl.message(
      'Enter your Email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get enterPassword {
    return Intl.message(
      'Enter password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `This Email is not valid`
  String get emailNotValid {
    return Intl.message(
      'This Email is not valid',
      name: 'emailNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Signup`
  String get signup {
    return Intl.message('Signup', name: 'signup', desc: '', args: []);
  }

  /// `Already have an account? Login`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account? Login',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Password must not be empty and must contain 6 characters with upper case letter and one number at least`
  String get passwordRule {
    return Intl.message(
      'Password must not be empty and must contain 6 characters with upper case letter and one number at least',
      name: 'passwordRule',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email verification`
  String get emailVerification {
    return Intl.message(
      'Email verification',
      name: 'emailVerification',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your code that send to your email address`
  String get enterVerificationCode {
    return Intl.message(
      'Please enter your code that send to your email address',
      name: 'enterVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Invalid code`
  String get invalidCode {
    return Intl.message(
      'Invalid code',
      name: 'invalidCode',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive code? Resend`
  String get resendCode {
    return Intl.message(
      'Didn\'t receive code? Resend',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `Forget password`
  String get forgetPassword {
    return Intl.message(
      'Forget password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email associated to your account`
  String get enterAssociatedEmail {
    return Intl.message(
      'Please enter your email associated to your account',
      name: 'enterAssociatedEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message('Remember me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Forget password?`
  String get forgetPasswordQuestion {
    return Intl.message(
      'Forget password?',
      name: 'forgetPasswordQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? Sign up`
  String get noAccountSignup {
    return Intl.message(
      'Don\'t have an account? Sign up',
      name: 'noAccountSignup',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get notHaveAnAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'notHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `password is required`
  String get passwordIsRequired {
    return Intl.message(
      'password is required',
      name: 'passwordIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `email is required`
  String get emailIsRequired {
    return Intl.message(
      'email is required',
      name: 'emailIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `enter valid email`
  String get enterValidEmail {
    return Intl.message(
      'enter valid email',
      name: 'enterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Login Failed`
  String get loginFailed {
    return Intl.message(
      'Login Failed',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Ok`
  String get ok {
    return Intl.message('Ok', name: 'ok', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Account created successfully`
  String get accountCreatedSuccessfully {
    return Intl.message(
      'Account created successfully',
      name: 'accountCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter phone number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid username`
  String get enterValidUsername {
    return Intl.message(
      'Enter valid username',
      name: 'enterValidUsername',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get thisFieldIsRequired {
    return Intl.message(
      'This field is required',
      name: 'thisFieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter numbers only`
  String get enterNumbersOnly {
    return Intl.message(
      'Enter numbers only',
      name: 'enterNumbersOnly',
      desc: '',
      args: [],
    );
  }

  /// `Enter value must equal 11 digit`
  String get enterValueMustEqual11Digit {
    return Intl.message(
      'Enter value must equal 11 digit',
      name: 'enterValueMustEqual11Digit',
      desc: '',
      args: [],
    );
  }

  /// `Connection timeout. Please try again later.`
  String get connectionTimeout {
    return Intl.message(
      'Connection timeout. Please try again later.',
      name: 'connectionTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Request timed out. Please try again.`
  String get sendTimeout {
    return Intl.message(
      'Request timed out. Please try again.',
      name: 'sendTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Server took too long to respond.`
  String get receiveTimeout {
    return Intl.message(
      'Server took too long to respond.',
      name: 'receiveTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Bad certificate. Please check your device date/time.`
  String get badCertificate {
    return Intl.message(
      'Bad certificate. Please check your device date/time.',
      name: 'badCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected error response from server`
  String get badResponse {
    return Intl.message(
      'Unexpected error response from server',
      name: 'badResponse',
      desc: '',
      args: [],
    );
  }

  /// `No response received from server.`
  String get noResponse {
    return Intl.message(
      'No response received from server.',
      name: 'noResponse',
      desc: '',
      args: [],
    );
  }

  /// `Failed to parse error response.`
  String get failedToParseResponse {
    return Intl.message(
      'Failed to parse error response.',
      name: 'failedToParseResponse',
      desc: '',
      args: [],
    );
  }

  /// `Request was cancelled. Please retry.`
  String get dioErrorCancel {
    return Intl.message(
      'Request was cancelled. Please retry.',
      name: 'dioErrorCancel',
      desc: '',
      args: [],
    );
  }

  /// `Network error. Please check your internet connection.`
  String get connectionError {
    return Intl.message(
      'Network error. Please check your internet connection.',
      name: 'connectionError',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred:`
  String get unknownError {
    return Intl.message(
      'An unexpected error occurred:',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown {
    return Intl.message('Unknown', name: 'unknown', desc: '', args: []);
  }

  /// `No subjects found`
  String get noSubjectsFound {
    return Intl.message(
      'No subjects found',
      name: 'noSubjectsFound',
      desc: '',
      args: [],
    );
  }

  /// `Survey`
  String get survey {
    return Intl.message('Survey', name: 'survey', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Browse by subject`
  String get browseBySubject {
    return Intl.message(
      'Browse by subject',
      name: 'browseBySubject',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
