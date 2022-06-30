import 'package:get_it/get_it.dart';
import 'package:synword/domain/repository/remote/sing_in_remote_repository.dart';

import '../model/token.dart';
import '../model/user/user.dart';
import '../repository/local/user_local_repository.dart';
import '../repository/remote/user_remote_repository.dart';

class GetTokenUseCase {
  final UserLocalRepository _userLocalRepository =
      GetIt.instance<UserLocalRepository>();

  final UserRemoteRepository _userRemoteRepository =
      GetIt.instance<UserRemoteRepository>();

  late User _user;

  Future<Token> getToken() async {
    _user = _userLocalRepository.getUser();

    if (_user.token == null || (_user.token != null && !_user.token!.isValid)) {
      var token = await _getTokenFromRemote();

      _user.token = token;

      await _userLocalRepository.save();
    }

    return _user.token!;
  }

  Future<Token> _getTokenFromRemote() async {
    late Token token;

    var signInRemoteRepository =
        await GetIt.instance.getAsync<SignInRemoteRepository>();

    var userAuthorizationData = signInRemoteRepository.getAuthorizationData();

    if (userAuthorizationData != null) {
      token = await _userRemoteRepository
          .getTokenByGoogleToken(userAuthorizationData.accessToken);
    } else {
      if (_user.id == null) {
        var id = await _userRemoteRepository.registerUser();

        _user.id = id;

        await _userLocalRepository.save();
      }

      token = await _userRemoteRepository.getTokenByUserId(_user.id!);
    }

    return token;
  }
}
