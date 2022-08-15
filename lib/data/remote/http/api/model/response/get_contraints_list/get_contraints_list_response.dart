import 'package:json_annotation/json_annotation.dart';

import 'user_contraints_item.dart';

part 'get_contraints_list_response.g.dart';

@JsonSerializable(createToJson: false)
class GetContraintsListResponse {
  @JsonKey(name: 'default')
  final UserContraintsItem guest;

  final UserContraintsItem silver;

  final UserContraintsItem gold;

  GetContraintsListResponse(this.guest, this.silver, this.gold);

  factory GetContraintsListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetContraintsListResponseFromJson(json);
}
