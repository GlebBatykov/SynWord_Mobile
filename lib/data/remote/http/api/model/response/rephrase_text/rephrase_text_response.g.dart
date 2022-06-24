// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rephrase_text_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RephraseTextResponse _$RephraseTextResponseFromJson(
        Map<String, dynamic> json) =>
    RephraseTextResponse(
      json['rephrasedText'] as String,
      (json['synonyms'] as List<dynamic>)
          .map((e) => ApiRephrasedWord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
