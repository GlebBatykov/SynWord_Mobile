import 'package:json_annotation/json_annotation.dart';

part 'api_check_result_link.g.dart';

@JsonSerializable(createToJson: false)
class ApiCheckResultLink {
  final String url;

  final double percent;

  ApiCheckResultLink(this.url, this.percent);

  factory ApiCheckResultLink.fromJson(Map<String, dynamic> json) =>
      _$ApiCheckResultLinkFromJson(json);
}
