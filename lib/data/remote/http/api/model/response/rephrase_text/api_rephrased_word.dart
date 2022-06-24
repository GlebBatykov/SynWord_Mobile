import 'package:json_annotation/json_annotation.dart';

part 'api_rephrased_word.g.dart';

@JsonSerializable(createToJson: false)
class ApiRephrasedWord {
  final String sourceText;

  final int synonymWordStartIndex;

  final int synonymWordEndIndex;

  final List<String> synonyms;

  ApiRephrasedWord(this.sourceText, this.synonymWordStartIndex,
      this.synonymWordEndIndex, this.synonyms);

  factory ApiRephrasedWord.fromJson(Map<String, dynamic> json) =>
      _$ApiRephrasedWordFromJson(json);
}
