import '../authorized_request.dart';

class RegisterByEmailRequest extends AuthorizedRequest {
  final String email;

  final String password;

  RegisterByEmailRequest(
      {required this.email, required this.password, required super.token});

  @override
  Map<String, dynamic> getBody() => {'Email': email, 'Password': password};
}
