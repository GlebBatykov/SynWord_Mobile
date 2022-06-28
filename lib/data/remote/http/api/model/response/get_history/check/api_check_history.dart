import 'package:json_annotation/json_annotation.dart';

import 'api_check_history_result_link.dart';

part 'api_check_history.g.dart';

@JsonSerializable(createToJson: false)
class ApiCheckHistory {
  final int id;

  final String text;

  final int percent;

  final List<ApiCheckHistoryResultLink> matches;

  ApiCheckHistory(this.id, this.text, this.percent, this.matches);

  factory ApiCheckHistory.fromJson(Map<String, dynamic> json) =>
      _$ApiCheckHistoryFromJson(json);
}
