// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_rephrase_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiRephraseHistory _$ApiRephraseHistoryFromJson(Map<String, dynamic> json) =>
    ApiRephraseHistory(
      json['id'] as int,
      json['sourceText'] as String,
      json['rephrasedText'] as String,
      (json['synonyms'] as List<dynamic>)
          .map((e) => ApiRephraseHistoryRephrasedWord.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
