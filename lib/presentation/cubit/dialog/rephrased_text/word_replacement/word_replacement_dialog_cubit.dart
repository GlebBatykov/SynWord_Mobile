import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../model/page/history/result/rephrase/rephrased_word.dart';

part 'word_replacement_dialog_state.dart';

class WordReplacementDialogCubit extends Cubit<WordReplacementDialogState> {
  final RephrasedWord _word;

  final void Function(RephrasedWord, int) _onSelect;

  WordReplacementDialogCubit(
      RephrasedWord word, void Function(RephrasedWord, int) onSelect)
      : _word = word,
        _onSelect = onSelect,
        super(WordReplacementDialogInitial()) {
    _initialize();
  }

  void _initialize() {
    emit(WordReplacementDialogShow(_word.sourceWord, _word.synonyms));
  }

  void selectSynonym(int index) {
    _onSelect(_word, index);

    Poseidon.instance.pop();
  }
}
