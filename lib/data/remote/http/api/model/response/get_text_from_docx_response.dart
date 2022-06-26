import 'package:json_annotation/json_annotation.dart';

part 'get_text_from_docx_response.g.dart';

@JsonSerializable(createToJson: false)
class GetTextFromDocxResponse {
  final String text;

  GetTextFromDocxResponse(this.text);

  factory GetTextFromDocxResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTextFromDocxResponseFromJson(json);
}
