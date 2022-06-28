import 'package:jwt_decode/jwt_decode.dart';

import 'enum/user_role.dart';

class Token {
  final String token;

  bool get isValid => !Jwt.isExpired(token);

  UserRole get role {
    var roleName = Jwt.parseJwt(token)['role'] as String;

    return UserRole.values.firstWhere((element) => element.name == roleName);
  }

  Token(this.token);
}
