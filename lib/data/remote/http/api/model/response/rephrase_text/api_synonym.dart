import 'package:json_annotation/json_annotation.dart';

part 'api_synonym.g.dart';

@JsonSerializable(createToJson: false)
class ApiSynonym {
  final String value;

  ApiSynonym(this.value);

  factory ApiSynonym.fromJson(Map<String, dynamic> json) =>
      _$ApiSynonymFromJson(json);
}
