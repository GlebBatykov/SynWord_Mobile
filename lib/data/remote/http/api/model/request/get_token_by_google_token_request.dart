import 'request.dart';

class GetTokenByGoogleTokenRequest extends Request {
  final String accessToken;

  GetTokenByGoogleTokenRequest(this.accessToken);
}
