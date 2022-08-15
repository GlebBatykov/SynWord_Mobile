import 'package:json_annotation/json_annotation.dart';

part 'authorize_by_google_token_response.g.dart';

@JsonSerializable(createToJson: false)
class AuthorizeByGoogleTokenResponse {
  final String accessToken;

  final String refreshToken;

  AuthorizeByGoogleTokenResponse(this.accessToken, this.refreshToken);

  factory AuthorizeByGoogleTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorizeByGoogleTokenResponseFromJson(json);
}
