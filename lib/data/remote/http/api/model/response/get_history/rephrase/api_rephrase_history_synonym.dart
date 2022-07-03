import 'package:json_annotation/json_annotation.dart';

part 'api_rephrase_history_synonym.g.dart';

@JsonSerializable(createToJson: false)
class ApiRephraseHistorySynonym {
  final String value;

  ApiRephraseHistorySynonym(this.value);

  factory ApiRephraseHistorySynonym.fromJson(Map<String, dynamic> json) =>
      _$ApiRephraseHistorySynonymFromJson(json);
}
