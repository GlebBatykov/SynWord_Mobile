import 'package:jwt_decode/jwt_decode.dart';

class Token {
  final String token;

  bool get isValid => !Jwt.isExpired(token);

  Token(this.token);
}
