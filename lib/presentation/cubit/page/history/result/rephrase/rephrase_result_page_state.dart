part of 'rephrase_result_page_cubit.dart';

@immutable
abstract class RephraseResultPageState {}

class RephraseResultPageInitial extends RephraseResultPageState {}

class RephraseResultPageShow extends RephraseResultPageState {
  final String text;

  final TextSource source;

  RephraseResultPageShow(this.text, this.source);
}
