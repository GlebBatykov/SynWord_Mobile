import 'package:json_annotation/json_annotation.dart';

part 'price_item.g.dart';

@JsonSerializable(createToJson: false)
class PriceItem {
  final String itemName;

  final double price;

  PriceItem(this.itemName, this.price);

  factory PriceItem.fromJson(Map<String, dynamic> json) =>
    _$PriceItemFromJson(json);
}
