part of 'rephrase_result_page_cubit.dart';

@immutable
abstract class RephraseResultPageState {}

class RephraseResultPageInitial extends RephraseResultPageState {}

class RephraseResultPageShow extends RephraseResultPageState {
  final String text;

  final String rephrasedText;

  final TextSource source;

  final List<RephrasedWord> rephrasedWord;

  RephraseResultPageShow(
      this.text, this.rephrasedText, this.source, this.rephrasedWord);
}
