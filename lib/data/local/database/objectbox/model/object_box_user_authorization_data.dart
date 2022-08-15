import 'package:objectbox/objectbox.dart';

@Entity()
class ObjectBoxUserAuthorizationData {
  int id;

  String? accessToken;

  String? refreshToken;

  ObjectBoxUserAuthorizationData(
      {this.id = 0, this.accessToken, this.refreshToken});
}
