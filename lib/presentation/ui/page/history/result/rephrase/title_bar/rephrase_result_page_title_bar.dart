import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../cubit/page/history/result/rephrase/rephrase_result_page_cubit.dart';
import '../../../../../button/rounded/rounded_copy_button.dart';
import '../../../../page_clock_board.dart';
import '../../../../page_title_bar.dart';

class RephraseResultPageTitleBar extends StatelessWidget {
  const RephraseResultPageTitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTitleBar(
      ratio: const [0.2, 0.6, 0.2],
      center: const PageClockBoard(),
      right: BlocBuilder<RephraseResultPageCubit, RephraseResultPageState>(
          builder: (context, state) {
        if (state is RephraseResultPageShow) {
          return const RoundedCopyButton();
        } else {
          return Container();
        }
      }),
    );
  }
}
