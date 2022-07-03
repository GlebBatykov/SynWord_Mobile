import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../../domain/model/result/rephrase/rephrase_result_rephrased_word.dart';

part 'word_replacement_dialog_state.dart';

class WordReplacementDialogCubit extends Cubit<WordReplacementDialogState> {
  final RephraseResultRephrasedWord _word;

  final void Function(RephraseResultRephrasedWord, int) _onSelectSynonym;

  final void Function(RephraseResultRephrasedWord) _onSelectSource;

  WordReplacementDialogCubit(
      RephraseResultRephrasedWord word,
      void Function(RephraseResultRephrasedWord, int) onSelectSynonym,
      void Function(RephraseResultRephrasedWord) onSelectSource)
      : _word = word,
        _onSelectSynonym = onSelectSynonym,
        _onSelectSource = onSelectSource,
        super(WordReplacementDialogInitial()) {
    _initialize();
  }

  void _initialize() {
    emit(WordReplacementDialogShow(_word.sourceWord, _word.synonyms));
  }

  void selectSynonym(int index) {
    _onSelectSynonym(_word, index);

    Poseidon.instance.pop();
  }

  void selectSource() {
    _onSelectSource(_word);

    Poseidon.instance.pop();
  }
}
