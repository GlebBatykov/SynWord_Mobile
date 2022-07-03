import 'package:google_sign_in/google_sign_in.dart';

import '../../../../domain/model/user/user_autorization_data.dart';
import '../../../../domain/model/user/user_info.dart';
import '../../../../domain/repository/remote/sing_in_remote_repository.dart';

class GoogleSignInRepository extends SignInRemoteRepository {
  UserAuthorizationData? _userAuthorizationData;

  late GoogleSignIn _googleSignIn;

  GoogleSignInAccount? _googleSignInAccount;

  GoogleSignInAuthentication? _googleSignInAuthentication;

  @override
  Stream<UserInfo> get userDataChanges => _googleSignIn.onCurrentUserChanged
      .map((event) => UserInfo(event!.displayName!, event.email));

  @override
  UserAuthorizationData? getAuthorizationData() => _userAuthorizationData;

  @override
  Future<void> initialize() async {
    _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);

    _googleSignInAccount = await _googleSignIn.signInSilently();

    await _authenticate();
  }

  @override
  Future<void> signIn() async {
    _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);

    _googleSignInAccount = await _googleSignIn.signIn();

    await _authenticate();
  }

  Future<void> _authenticate() async {
    if (_googleSignInAccount != null) {
      _googleSignInAuthentication = await _googleSignInAccount!.authentication;

      _userAuthorizationData = UserAuthorizationData(
          UserInfo(
              _googleSignInAccount!.displayName!, _googleSignInAccount!.email),
          _googleSignInAuthentication!.accessToken!);
    }
  }

  @override
  Future<void> logout() async {
    if (await _googleSignIn.isSignedIn()) {
      await _googleSignIn.disconnect();

      _googleSignInAccount = null;
      _googleSignInAuthentication = null;
      _userAuthorizationData = null;
    }
  }
}
