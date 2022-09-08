import '../../model/user/user_data.dart';

abstract class UserDataRemoteRepository {
  Future<UserData> getUserData();
}
