// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_rephrase_history_rephrased_word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiRephraseHistoryRephrasedWord _$ApiRephraseHistoryRephrasedWordFromJson(
        Map<String, dynamic> json) =>
    ApiRephraseHistoryRephrasedWord(
      json['sourceWord'] as String,
      json['synonymWordStartIndex'] as int,
      json['synonymWordEndIndex'] as int,
      (json['synonyms'] as List<dynamic>).map((e) => e as String).toList(),
    );
