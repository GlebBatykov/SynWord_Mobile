import 'package:json_annotation/json_annotation.dart';

part 'authorize_by_email_response.g.dart';

@JsonSerializable(createToJson: false)
class AuthorizeByEmailResponse {
  final String accessToken;

  final String refreshToken;

  AuthorizeByEmailResponse(this.accessToken, this.refreshToken);

  factory AuthorizeByEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorizeByEmailResponseFromJson(json);
}
