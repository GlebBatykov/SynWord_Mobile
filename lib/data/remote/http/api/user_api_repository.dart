import '../../../../domain/model/token.dart';
import '../../../../domain/model/user/user_authorization_data.dart';
import '../../../../domain/repository/remote/user_remote_repository.dart';
import '../../../../domain/use_case/get_token_use_case.dart';
import 'model/request/authorize/authorize_by_email_request.dart';
import 'model/request/authorize/authorize_by_google_token_request.dart';
import 'model/request/authorize/authorize_by_user_id_request.dart';
import 'model/request/refresh_token_request.dart';
import 'model/request/register/register_by_email_request.dart';
import 'model/request/register/register_by_google_token_request.dart';
import 'service/authorize/authorize_by_email_service.dart';
import 'service/authorize/authorize_by_google_token_service.dart';
import 'service/authorize/authorize_by_user_id_service.dart';
import 'service/refresh_token_service.dart';
import 'service/register/register_by_email_service.dart';
import 'service/register/register_by_google_token_service.dart';
import 'service/register/register_user_service.dart';

class UserApiRepository extends UserRemoteRepository {
  @override
  Future<String> registerUser() async {
    var response = await RegisterUserService().register();

    return response.userId;
  }

  @override
  Future<UserAuthorizationData> authorizeByUserId(String userId) async {
    var request = AuthorizeByUserIdRequest(userId: userId);

    var response = await AuthorizeByUserIdService().authorize(request);

    return UserAuthorizationData(
        Token(response.accessToken), Token(response.refreshToken));
  }

  @override
  Future<void> registerByGoogleToken(String accessToken) async {
    var token = await GetTokenUseCase().getToken();

    var request = RegisterByGoogleTokenRequest(
        accessToken: accessToken, token: token.token);

    await RegisterByGoogleTokenService().register(request);
  }

  @override
  Future<UserAuthorizationData> authorizeByGoogleToken(
      String accessToken) async {
    var request = AuthorizeByGoogleTokenRequest(accessToken);

    var response = await AuthorizeByGoogleTokenService().authorize(request);

    return UserAuthorizationData(
        Token(response.accessToken), Token(response.refreshToken));
  }

  @override
  Future<void> registerByEmail(String email, String password) async {
    var token = await GetTokenUseCase().getToken();

    var request = RegisterByEmailRequest(
        email: email, password: password, token: token.token);

    await RegisterByEmailService().register(request);
  }

  @override
  Future<UserAuthorizationData> authorizeByEmail(
      String email, String password) async {
    var request = AuthorizeByEmailRequest(email: email, password: password);

    var response = await AuthorizeByEmailService().authorize(request);

    return UserAuthorizationData(
        Token(response.accessToken), Token(response.refreshToken));
  }

  @override
  Future<UserAuthorizationData> refreshToken(String refreshToken) async {
    var request = RefreshTokenRequest(refreshToken);

    var response = await RefreshTokenService().refresh(request);

    return UserAuthorizationData(
        Token(response.accessToken), Token(response.refreshToken));
  }
}
