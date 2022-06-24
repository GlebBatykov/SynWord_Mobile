import 'package:json_annotation/json_annotation.dart';

import 'api_rephrased_word.dart';

part 'rephrase_text_response.g.dart';

@JsonSerializable(createToJson: false)
class RephraseTextResponse {
  final String rephrasedText;

  final List<ApiRephrasedWord> synonyms;

  RephraseTextResponse(this.rephrasedText, this.synonyms);

  factory RephraseTextResponse.fromJson(Map<String, dynamic> json) =>
      _$RephraseTextResponseFromJson(json);
}
