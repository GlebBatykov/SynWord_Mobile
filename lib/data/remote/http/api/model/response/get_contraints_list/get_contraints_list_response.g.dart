// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_contraints_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetContraintsListResponse _$GetContraintsListResponseFromJson(
        Map<String, dynamic> json) =>
    GetContraintsListResponse(
      UserContraintsItem.fromJson(json['default'] as Map<String, dynamic>),
      UserContraintsItem.fromJson(json['silver'] as Map<String, dynamic>),
      UserContraintsItem.fromJson(json['gold'] as Map<String, dynamic>),
    );
