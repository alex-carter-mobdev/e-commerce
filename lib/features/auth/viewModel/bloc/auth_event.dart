abstract class AuthEvent {}

class AuthSaveEmail extends AuthEvent {
  static String email = '';
  String requestedEmail;

  AuthSaveEmail(this.requestedEmail) {
    email = requestedEmail;
  }
}
