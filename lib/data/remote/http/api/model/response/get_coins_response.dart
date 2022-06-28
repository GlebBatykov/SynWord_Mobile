import 'package:json_annotation/json_annotation.dart';

part 'get_coins_response.g.dart';

@JsonSerializable(createToJson: false)
class GetCoinsResponse {
  final int coins;

  GetCoinsResponse(this.coins);

  factory GetCoinsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCoinsResponseFromJson(json);
}
