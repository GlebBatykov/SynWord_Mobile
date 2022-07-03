import 'package:json_annotation/json_annotation.dart';

part 'api_check_history_result_link.g.dart';

@JsonSerializable(createToJson: false)
class ApiCheckHistoryResultLink {
  final String url;

  final double percent;

  ApiCheckHistoryResultLink(this.url, this.percent);

  factory ApiCheckHistoryResultLink.fromJson(Map<String, dynamic> json) =>
      _$ApiCheckHistoryResultLinkFromJson(json);
}
