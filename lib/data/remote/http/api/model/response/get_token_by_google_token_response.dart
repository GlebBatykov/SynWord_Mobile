import 'package:json_annotation/json_annotation.dart';

part 'get_token_by_google_token_response.g.dart';

@JsonSerializable(createToJson: false)
class GetTokenByGoogleTokenResponse {
  final String token;

  GetTokenByGoogleTokenResponse(this.token);

  factory GetTokenByGoogleTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTokenByGoogleTokenResponseFromJson(json);
}
