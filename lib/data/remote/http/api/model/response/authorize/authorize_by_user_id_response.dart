import 'package:json_annotation/json_annotation.dart';

part 'authorize_by_user_id_response.g.dart';

@JsonSerializable(createToJson: false)
class AuthorizeByUserIdResponse {
  final String accessToken;

  final String refreshToken;

  AuthorizeByUserIdResponse(this.accessToken, this.refreshToken);

  factory AuthorizeByUserIdResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorizeByUserIdResponseFromJson(json);
}
