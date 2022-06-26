import 'package:json_annotation/json_annotation.dart';

import 'api_check_result_link.dart';

part 'check_text_response.g.dart';

@JsonSerializable(createToJson: false)
class CheckTextResponse {
  final String text;

  final double percent;

  final List<ApiCheckResultLink> matches;

  CheckTextResponse(this.text, this.percent, this.matches);

  factory CheckTextResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckTextResponseFromJson(json);
}
