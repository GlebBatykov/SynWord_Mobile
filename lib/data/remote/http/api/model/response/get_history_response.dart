import 'package:json_annotation/json_annotation.dart';

import 'check_text/check_text_response.dart';
import 'rephrase_text/rephrase_text_response.dart';

part 'get_history_response.g.dart';

@JsonSerializable(createToJson: false)
class GetHistoryResponse {
  final List<RephraseTextResponse> rephraseHistories;

  final List<CheckTextResponse> plagiarismCheckHistories;

  GetHistoryResponse(this.rephraseHistories, this.plagiarismCheckHistories);

  factory GetHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$GetHistoryResponseFromJson(json);
}
