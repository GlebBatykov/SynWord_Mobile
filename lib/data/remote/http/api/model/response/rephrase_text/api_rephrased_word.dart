import 'package:json_annotation/json_annotation.dart';

import 'api_synonym.dart';

part 'api_rephrased_word.g.dart';

@JsonSerializable(createToJson: false)
class ApiRephrasedWord {
  final String sourceWord;

  final int synonymWordStartIndex;

  final int synonymWordEndIndex;

  final List<ApiSynonym> synonyms;

  ApiRephrasedWord(this.sourceWord, this.synonymWordStartIndex,
      this.synonymWordEndIndex, this.synonyms);

  factory ApiRephrasedWord.fromJson(Map<String, dynamic> json) =>
      _$ApiRephrasedWordFromJson(json);
}
