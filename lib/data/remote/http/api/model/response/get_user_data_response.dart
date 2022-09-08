import 'package:json_annotation/json_annotation.dart';

part 'get_user_data_response.g.dart';

@JsonSerializable(createToJson: false)
class GetUserDataResponse {
  final String role;

  final int balance;

  GetUserDataResponse(this.role, this.balance);

  factory GetUserDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserDataResponseFromJson(json);
}
