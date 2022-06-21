import '../../../../domain/model/token.dart';
import '../../../../domain/repository/remote/user_remote_repository.dart';
import '../../../../domain/use_case/get_token_use_case.dart';
import 'model/request/get_token_by_google_token_request.dart';
import 'model/request/get_token_by_user_id_request.dart';
import 'model/request/register_by_google_token_request.dart';
import 'service/get_token_by_google_token_service.dart';
import 'service/get_token_by_user_id_service.dart';
import 'service/register_by_google_token_service.dart';
import 'service/register_user_service.dart';

class UserApiRepository extends UserRemoteRepository {
  @override
  Future<String> registerUser() async {
    var response = await RegisterUserService().register();

    return response.userId;
  }

  @override
  Future<Token> getTokenByUserId(String userId) async {
    var request = GetTokenByUserIdRequest(userId: userId);

    var response = await GetTokenByUserIdService().getToken(request);

    return Token(response.token);
  }

  @override
  Future<void> registerByGoogleToken(String accessToken) async {
    var token = await GetTokenUseCase().getToken();

    var request = RegisterByGoogleTokenRequest(
        accessToken: accessToken, token: token.token);

    await RegisterByGoogleTokenService().register(request);
  }

  @override
  Future<Token> getTokenByGoogleToken(String accessToken) async {
    var request = GetTokenByGoogleTokenRequest(accessToken);

    var response = await GetTokenByGoogleTokenService().getToken(request);

    return Token(response.token);
  }
}
