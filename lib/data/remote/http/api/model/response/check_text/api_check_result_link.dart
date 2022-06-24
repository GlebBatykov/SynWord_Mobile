import 'package:json_annotation/json_annotation.dart';

part 'api_check_result_link.g.dart';

@JsonSerializable(createToJson: false)
class ApiCheckResultLink {
  final String url;

  final int percentages;

  ApiCheckResultLink(this.url, this.percentages);

  factory ApiCheckResultLink.fromJson(Map<String, dynamic> json) =>
      _$ApiCheckResultLinkFromJson(json);
}
