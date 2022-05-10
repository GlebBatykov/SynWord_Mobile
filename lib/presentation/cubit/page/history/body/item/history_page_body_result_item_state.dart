part of 'history_page_body_result_item_cubit.dart';

@immutable
abstract class HistoryPageBodyResultItemState {}

class HistoryPageBodyResultItemInitial extends HistoryPageBodyResultItemState {}

class HistoryPageBodyResultItemShow extends HistoryPageBodyResultItemState {
  final String title;

  final String text;

  final void Function() onTap;

  HistoryPageBodyResultItemShow(this.title, this.text, this.onTap);
}

class HistoryPageBodyResultItemCheck extends HistoryPageBodyResultItemShow {
  final int percentages;

  HistoryPageBodyResultItemCheck(
      String title, String text, void Function() onTap, this.percentages)
      : super(title, text, onTap);
}

class HistoryPageBodyResultItemRephrase extends HistoryPageBodyResultItemShow {
  HistoryPageBodyResultItemRephrase(
      String title, String text, void Function() onTap)
      : super(title, text, onTap);
}
