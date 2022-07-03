// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_rephrased_word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiRephrasedWord _$ApiRephrasedWordFromJson(Map<String, dynamic> json) =>
    ApiRephrasedWord(
      json['sourceWord'] as String,
      json['synonymWordStartIndex'] as int,
      json['synonymWordEndIndex'] as int,
      (json['synonyms'] as List<dynamic>)
          .map((e) => ApiSynonym.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
