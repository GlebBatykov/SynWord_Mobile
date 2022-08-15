import 'package:synword/data/remote/http/api/model/request/request.dart';

class AuthorizeByEmailRequest extends Request {
  final String email;

  final String password;

  AuthorizeByEmailRequest({required this.email, required this.password});

  @override
  Map<String, dynamic> getBody() => {'Email': email, 'Password': password};
}
