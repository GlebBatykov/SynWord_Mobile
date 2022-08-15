import 'package:json_annotation/json_annotation.dart';

part 'user_contraints_item.g.dart';

@JsonSerializable(createToJson: false)
class UserContraintsItem {
  final int plagiarismCheckMaxSymbolLimit;

  final int rephraseMaxSymbolLimit;

  final int enhancedRephraseMaxSymbolLimit;

  UserContraintsItem(this.plagiarismCheckMaxSymbolLimit,
      this.rephraseMaxSymbolLimit, this.enhancedRephraseMaxSymbolLimit);

  factory UserContraintsItem.fromJson(Map<String, dynamic> json) =>
      _$UserContraintsItemFromJson(json);
}
