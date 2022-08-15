import '../../model/user/user_authorization_data.dart';

abstract class UserRemoteRepository {
  Future<String> registerUser();

  Future<UserAuthorizationData> authorizeByUserId(String userId);

  Future<void> registerByGoogleToken(String accessToken);

  Future<UserAuthorizationData> authorizeByGoogleToken(String accessToken);

  Future<void> registerByEmail(String email, String password);

  Future<UserAuthorizationData> authorizeByEmail(String email, String password);

  Future<UserAuthorizationData> refreshToken(String refreshToken);
}
