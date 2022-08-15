import '../request.dart';

class AuthorizeByUserIdRequest extends Request {
  final String userId;

  AuthorizeByUserIdRequest({required this.userId});

  @override
  Map<String, dynamic> getBody() => {'UserId': userId};
}
