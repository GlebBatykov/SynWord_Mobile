import 'package:json_annotation/json_annotation.dart';

part 'get_token_by_user_id_response.g.dart';

@JsonSerializable(createToJson: false)
class GetTokenByUserIdResponse {
  final String token;

  GetTokenByUserIdResponse(this.token);

  factory GetTokenByUserIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTokenByUserIdResponseFromJson(json);
}
