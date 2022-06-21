import 'package:mapper_box/mapper_box.dart';

import '../../domain/model/token.dart';
import '../../domain/model/user.dart';
import '../local/database/objectbox/model/object_box_token.dart';
import '../local/database/objectbox/model/object_box_user.dart';

class MapperBoxConfiguration {
  void configurate() {
    var mapperBox = MapperBox.instanse;

    mapperBox.register<ObjectBoxToken, Token?>(
        (object) => object.token != null ? Token(object.token!) : null);
    mapperBox.register<Token, ObjectBoxToken>(
        (object) => ObjectBoxToken(token: object.token));

    mapperBox.register<ObjectBoxUser, User>((object) {
      var token = object.token.target != null
          ? mapperBox.map<ObjectBoxToken, Token?>(object.token.target!)
          : null;

      return User(
          id: object.userId, token: token, accessToken: object.accessToken);
    });
    mapperBox.register<User, ObjectBoxUser>((object) {
      var objectBoxUser =
          ObjectBoxUser(userId: object.id, accessToken: object.accessToken);

      if (object.token != null) {
        objectBoxUser.token.target =
            mapperBox.map<Token, ObjectBoxToken>(object.token!);
      }

      return objectBoxUser;
    });
  }
}
