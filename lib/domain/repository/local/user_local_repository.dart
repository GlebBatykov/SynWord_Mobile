import '../../model/user/user.dart';

abstract class UserLocalRepository {
  User getUser();

  void setUser(User user);

  Future<void> load();

  Future<void> save();
}
