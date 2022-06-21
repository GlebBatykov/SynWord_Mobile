import 'package:objectbox/objectbox.dart';

import 'object_box_token.dart';

@Entity()
class ObjectBoxUser {
  int id;

  String? userId;

  ToOne<ObjectBoxToken> token = ToOne<ObjectBoxToken>();

  String? accessToken;

  ObjectBoxUser({this.id = 0, this.userId, this.accessToken});
}
