// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_text_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckTextResponse _$CheckTextResponseFromJson(Map<String, dynamic> json) =>
    CheckTextResponse(
      json['text'] as String,
      json['percent'] as int,
      (json['matches'] as List<dynamic>)
          .map((e) => ApiCheckResultLink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
