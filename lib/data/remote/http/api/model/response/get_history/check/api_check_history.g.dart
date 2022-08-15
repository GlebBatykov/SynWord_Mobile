// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_check_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiCheckHistory _$ApiCheckHistoryFromJson(Map<String, dynamic> json) =>
    ApiCheckHistory(
      json['id'] as int,
      json['text'] as String,
      json['percent'] as num,
      (json['matches'] as List<dynamic>)
          .map((e) =>
              ApiCheckHistoryResultLink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
