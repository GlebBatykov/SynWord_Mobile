import '../authorized_request.dart';

class RegisterByGoogleTokenRequest extends AuthorizedRequest {
  final String accessToken;

  RegisterByGoogleTokenRequest(
      {required super.token, required this.accessToken});

  @override
  Map<String, dynamic> getBody() => {'AccessToken': accessToken};
}
