import 'package:json_annotation/json_annotation.dart';

import 'price_item.dart';

part 'get_price_list_response.g.dart';

@JsonSerializable(createToJson: false)
class GetPriceListResponse {
  final List<PriceItem> prices;

  GetPriceListResponse(this.prices);

  factory GetPriceListResponse.fromJson(Map<String, dynamic> json) =>
  _$GetPriceListResponseFromJson(json);
}
