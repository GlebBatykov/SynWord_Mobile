// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_price_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPriceListResponse _$GetPriceListResponseFromJson(
        Map<String, dynamic> json) =>
    GetPriceListResponse(
      (json['prices'] as List<dynamic>)
          .map((e) => PriceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
