part of 'word_replacement_dialog_cubit.dart';

@immutable
abstract class WordReplacementDialogState {}

class WordReplacementDialogInitial extends WordReplacementDialogState {}

class WordReplacementDialogShow extends WordReplacementDialogState {
  final String word;

  final List<String> synonyms;

  WordReplacementDialogShow(this.word, this.synonyms);
}
