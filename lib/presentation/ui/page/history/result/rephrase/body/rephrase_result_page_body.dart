import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synword/presentation/ui/page/history/result/result_page_initial_text.dart';

import '../../../../../../cubit/page/history/result/rephrase/rephrase_result_page_cubit.dart';
import '../../../../../../model/page/history/result/rephrase/rephrased_word.dart';
import '../../../../page_body.dart';
import '../../result_page_tab_controller.dart';

class RephraseResultPageBody extends StatelessWidget {
  const RephraseResultPageBody({Key? key}) : super(key: key);

  List<TextSpan> _buildTextSpans(
      String text, List<RephrasedWord> rephrasedWords) {
    var textSpans = <TextSpan>[];

    textSpans.add(TextSpan(text: text));

    return textSpans;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RephraseResultPageCubit, RephraseResultPageState>(
        builder: (context, state) {
      if (state is RephraseResultPageShow) {
        return ResultPageTabController(
            first: ResultPageInitialText(text: state.text),
            second: Container(
              margin: const EdgeInsets.only(top: 17, bottom: 17),
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: RawScrollbar(
                      thickness: 1,
                      isAlwaysShown: true,
                      thumbColor: Colors.black.withOpacity(0.7),
                      crossAxisMargin: 5,
                      child: Container(
                        margin: const EdgeInsets.only(left: 13, right: 13),
                        child: SingleChildScrollView(
                            child: SelectableText.rich(TextSpan(
                                style: const TextStyle(fontSize: 16),
                                children: _buildTextSpans(state.rephrasedText,
                                    state.rephrasedWord)))),
                      ))),
            ));
      } else {
        return const PageBody();
      }
    });
  }
}
