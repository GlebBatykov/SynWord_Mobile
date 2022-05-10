import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../cubit/page/history/result/rephrase/rephrase_result_page_cubit.dart';
import '../../../../../rephrased_text/rephrased_text.dart';
import '../../../../page_body.dart';
import '../../result_page_initial_text.dart';
import '../../result_page_tab_controller.dart';

class RephraseResultPageBody extends StatelessWidget {
  const RephraseResultPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pageCubit = context.watch<RephraseResultPageCubit>();

    return BlocBuilder<RephraseResultPageCubit, RephraseResultPageState>(
        bloc: pageCubit,
        builder: (context, state) {
          if (state is RephraseResultPageShow) {
            return ResultPageTabController(
                first: ResultPageInitialText(text: state.text),
                second: Container(
                  margin: const EdgeInsets.only(top: 17, bottom: 17),
                  child: BlocProvider.value(
                      value: state.rephrasedTextCubit,
                      child: const RephrasedText()),
                ),
                onChange: (index) {
                  pageCubit.changeSelectedTab(index);
                });
          } else {
            return const PageBody();
          }
        });
  }
}
