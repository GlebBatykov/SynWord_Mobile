import 'package:objectbox/objectbox.dart';

@Entity()
class ObjectBoxToken {
  int id;

  String? token;

  ObjectBoxToken({this.id = 0, required this.token});
}
