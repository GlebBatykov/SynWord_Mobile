import '../request.dart';

class AuthorizeByGoogleTokenRequest extends Request {
  final String accessToken;

  AuthorizeByGoogleTokenRequest(this.accessToken);
}
