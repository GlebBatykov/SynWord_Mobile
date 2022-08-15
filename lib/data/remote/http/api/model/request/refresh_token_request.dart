import 'package:synword/data/remote/http/api/model/request/request.dart';

class RefreshTokenRequest extends Request {
  final String refreshToken;

  RefreshTokenRequest(this.refreshToken);

  @override
  Map<String, dynamic> getBody() => {'RefreshToken': refreshToken};
}
