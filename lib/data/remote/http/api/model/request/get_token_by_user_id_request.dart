import 'request.dart';

class GetTokenByUserIdRequest extends Request {
  final String userId;

  GetTokenByUserIdRequest({required this.userId});

  @override
  Map<String, dynamic> getBody() => {'UserId': userId};
}
