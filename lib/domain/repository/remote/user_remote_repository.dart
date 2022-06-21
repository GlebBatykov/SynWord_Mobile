import '../../model/token.dart';

abstract class UserRemoteRepository {
  Future<String> registerUser();

  Future<Token> getTokenByUserId(String userId);

  Future<void> registerByGoogleToken(String accessToken);

  Future<Token> getTokenByGoogleToken(String accessToken);
}
