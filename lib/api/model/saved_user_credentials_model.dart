class SavedUserCredentialsModel {
  final bool isRemembered;
  final String? email;
  final String? password;

  SavedUserCredentialsModel({
    this.isRemembered = false,
    this.email,
    this.password,
  });
}
