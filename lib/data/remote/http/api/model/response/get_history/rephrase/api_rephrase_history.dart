import 'package:json_annotation/json_annotation.dart';

import 'api_rephrase_history_rephrased_word.dart';

part 'api_rephrase_history.g.dart';

@JsonSerializable(createToJson: false)
class ApiRephraseHistory {
  final int id;

  final String sourceText;

  final String rephrasedText;

  final List<ApiRephraseHistoryRephrasedWord> synonyms;

  ApiRephraseHistory(
      this.id, this.sourceText, this.rephrasedText, this.synonyms);

  factory ApiRephraseHistory.fromJson(Map<String, dynamic> json) =>
      _$ApiRephraseHistoryFromJson(json);
}
