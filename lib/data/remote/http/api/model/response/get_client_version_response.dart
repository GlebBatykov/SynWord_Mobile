import 'package:json_annotation/json_annotation.dart';

part 'get_client_version_response.g.dart';

@JsonSerializable(createToJson: false)
class GetClientVersionResponse {
  final String clientAppVersion;

  GetClientVersionResponse(this.clientAppVersion);

  factory GetClientVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetClientVersionResponseFromJson(json);
}
