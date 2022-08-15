import 'package:objectbox/objectbox.dart';

import 'object_box_user_authorization_data.dart';

@Entity()
class ObjectBoxUser {
  int id;

  String? userId;

  ToOne<ObjectBoxUserAuthorizationData> authorizationData =
      ToOne<ObjectBoxUserAuthorizationData>();

  ObjectBoxUser({this.id = 0, this.userId});
}
