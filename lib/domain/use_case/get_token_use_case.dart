import 'dart:io';

import 'package:get_it/get_it.dart';

import '../model/token.dart';
import '../model/user/user.dart';
import '../model/user/user_authorization_data.dart';
import '../repository/local/user_local_repository.dart';
import '../repository/remote/sing_in_remote_repository.dart';
import '../repository/remote/user_remote_repository.dart';

class GetTokenUseCase {
  final UserLocalRepository _userLocalRepository =
      GetIt.instance<UserLocalRepository>();

  final UserRemoteRepository _userRemoteRepository =
      GetIt.instance<UserRemoteRepository>();

  late User _user;

  Future<Token> getToken() async {
    _user = _userLocalRepository.getUser();

    if (_user.authorizationData == null) {
      var authorizationData = await _getAuthorizationDataFromRemote();

      _user.authorizationData = authorizationData;

      await _userLocalRepository.save();
    } else if ((_user.authorizationData != null &&
        !_user.authorizationData!.accessToken.isValid)) {
      var authorizationData = await _userRemoteRepository
          .refreshToken(_user.authorizationData!.refreshToken.token);

      _user.authorizationData = authorizationData;

      await _userLocalRepository.save();
    }

    return _user.authorizationData!.accessToken;
  }

  Future<UserAuthorizationData> _getAuthorizationDataFromRemote() async {
    late UserAuthorizationData authorizationData;

    var signInRemoteRepository =
        await GetIt.instance.getAsync<SignInRemoteRepository>();

    var userSignInData = signInRemoteRepository.getAuthorizationData();

    if (userSignInData != null) {
      if (Platform.isAndroid) {
        authorizationData = await _userRemoteRepository
            .authorizeByGoogleToken(userSignInData.accessToken);
      }
    } else {
      if (_user.id == null) {
        var id = await _userRemoteRepository.registerUser();

        _user.id = id;

        await _userLocalRepository.save();
      }

      authorizationData =
          await _userRemoteRepository.authorizeByUserId(_user.id!);
    }

    return authorizationData;
  }
}
