import 'package:json_annotation/json_annotation.dart';

import 'check/api_check_history.dart';
import 'rephrase/api_rephrase_history.dart';

part 'get_history_response.g.dart';

@JsonSerializable(createToJson: false)
class GetHistoryResponse {
  final List<ApiRephraseHistory> rephraseHistories;

  final List<ApiCheckHistory> plagiarismCheckHistories;

  GetHistoryResponse(this.rephraseHistories, this.plagiarismCheckHistories);

  factory GetHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$GetHistoryResponseFromJson(json);
}
