import 'request.dart';

class AuthorizedRequest extends Request {
  final String token;

  AuthorizedRequest({required this.token});

  @override
  Map<String, dynamic> getHeaders() => {'Authorization': 'Bearer $token'};
}
