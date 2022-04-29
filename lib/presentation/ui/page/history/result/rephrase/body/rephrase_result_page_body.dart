import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/page/history/result/result_page_initial_text.dart';

import '../../../../../../cubit/page/history/result/rephrase/rephrase_result_page_cubit.dart';
import '../../../../page_body.dart';
import '../../result_page_tab_controller.dart';

class RephraseResultPageBody extends StatelessWidget {
  const RephraseResultPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RephraseResultPageCubit, RephraseResultPageState>(
        builder: (context, state) {
      if (state is RephraseResultPageShow) {
        return ResultPageTabController(
            first: ResultPageInitialText(text: state.text),
            second: Container());
      } else {
        return const PageBody();
      }
    });
  }
}
