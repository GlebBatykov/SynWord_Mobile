import 'package:get_it/get_it.dart';
import 'package:mapper_box/mapper_box.dart';

import '../../../../domain/model/user.dart';
import '../../../../domain/repository/local/user_local_repository.dart';
import '../../../../objectbox.g.dart';
import 'model/object_box_user.dart';

class UserObjectboxRepository extends UserLocalRepository {
  final Box<ObjectBoxUser> _box = GetIt.instance<Store>().box<ObjectBoxUser>();

  final MapperBox _mapperBox = MapperBox.instanse;

  User _user = User();

  @override
  User getUser() {
    return _user;
  }

  @override
  void setUser(User user) {
    _user = user;
  }

  @override
  Future<void> load() async {
    if (_box.contains(1)) {
      var objectBoxUser = _box.get(1)!;

      _user = _mapperBox.map<ObjectBoxUser, User>(objectBoxUser);
    } else {
      _user = User();
    }
  }

  @override
  Future<void> save() async {
    _box.remove(1);

    var objectBoxUser = _mapperBox.map<User, ObjectBoxUser>(_user);

    _box.put(objectBoxUser);
  }
}
