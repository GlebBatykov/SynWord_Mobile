import 'package:json_annotation/json_annotation.dart';

part 'register_user_response.g.dart';

@JsonSerializable(createToJson: false)
class RegisterUserResponse {
  final String userId;

  RegisterUserResponse(this.userId);

  factory RegisterUserResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserResponseFromJson(json);
}
