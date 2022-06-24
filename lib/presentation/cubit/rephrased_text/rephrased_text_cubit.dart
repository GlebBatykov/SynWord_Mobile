import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:poseidon/poseidon.dart';

import '../../../domain/model/rephrase/rephrased_word.dart';
import '../../ui/dialog/word_replacement_dialog.dart';
import '../dialog/rephrased_text/word_replacement/word_replacement_dialog_cubit.dart';

part 'rephrased_text_state.dart';

class RephrasedTextCubit extends Cubit<RephrasedTextState> {
  String _text;

  final List<RephrasedWord> _rephrasedWords;

  String get text => _text;

  RephrasedTextCubit(String text, List<RephrasedWord> rephrasedWords)
      : _text = text,
        _rephrasedWords = rephrasedWords,
        super(RephrasedTextInitial()) {
    _initialize();
  }

  void _initialize() {
    _show();
  }

  List<InlineSpan> _buildSpans() {
    var textSpans = <InlineSpan>[];

    var start = 0;
    var text = '';

    void addCommonSpan() {
      textSpans.add(
          TextSpan(text: text, style: const TextStyle(color: Colors.black)));
    }

    void addRephrasedSpan(RephrasedWord word) {
      textSpans.add(WidgetSpan(
          child: GestureDetector(
        onTap: _onTap(word),
        child: Container(
            decoration: BoxDecoration(
                color: HexColor('#DDC5A2'),
                borderRadius: BorderRadius.circular(5)),
            padding:
                const EdgeInsets.only(left: 2, right: 2, top: 1, bottom: 1),
            child: Text(text, style: const TextStyle(fontSize: 15))),
      )));
    }

    if (_rephrasedWords.isNotEmpty && _rephrasedWords.first.startIndex > 0) {
      text = _text.substring(start, _rephrasedWords.first.startIndex);

      addCommonSpan();

      start = _rephrasedWords.first.startIndex;
    }

    for (var i = 0; i < _rephrasedWords.length; i++) {
      text = _text.substring(start, _rephrasedWords[i].endIndex + 1);

      addRephrasedSpan(_rephrasedWords[i]);

      start = _rephrasedWords[i].endIndex + 1;

      if (i + 1 < _rephrasedWords.length) {
        text = _text.substring(start, _rephrasedWords[i + 1].startIndex);

        addCommonSpan();

        start = _rephrasedWords[i + 1].startIndex;
      }
    }

    if (start != _text.length - 1) {
      text = _text.substring(start, _text.length);
      addCommonSpan();
    }

    return textSpans;
  }

  void Function() _onTap(RephrasedWord word) {
    return () {
      Poseidon.instance.callDialog((context) => BlocProvider(
          create: (context) =>
              WordReplacementDialogCubit(word, _onSelectSynonym),
          child: const WordReplacementDialog()));
    };
  }

  void _onSelectSynonym(RephrasedWord word, int index) {
    var synonym = word.synonyms[index];

    _text = _text.replaceRange(word.startIndex, word.endIndex + 1, synonym);

    word.endIndex = word.startIndex + synonym.length - 1;

    word.synonyms.remove(synonym);

    word.synonyms.add(word.sourceWord);

    word.sourceWord = synonym;

    _show();
  }

  void _show() {
    emit(RephrasedTextShow(_buildSpans()));
  }
}
