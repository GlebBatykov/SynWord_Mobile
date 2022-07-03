import 'package:json_annotation/json_annotation.dart';

part 'enhanced_rephrase_text_response.g.dart';

@JsonSerializable(createToJson: false)
class EnhancedRephraseTextResponse {
  final String rephrasedText;

  EnhancedRephraseTextResponse(this.rephrasedText);

  factory EnhancedRephraseTextResponse.fromJson(Map<String, dynamic> json) =>
      _$EnhancedRephraseTextResponseFromJson(json);
}
