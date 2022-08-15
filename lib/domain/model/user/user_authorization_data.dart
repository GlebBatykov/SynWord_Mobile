import '../token.dart';

class UserAuthorizationData {
  final Token accessToken;

  final Token refreshToken;

  UserAuthorizationData(this.accessToken, this.refreshToken);
}
