import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synword/presentation/ui/check_result_links/check_result_links.dart';

import '../../../../../../cubit/page/history/result/check/check_result_page_cubit.dart';
import '../../../../page_body.dart';
import '../../result_page_initial_text.dart';
import '../../result_page_tab_controller.dart';

class CheckResultPageBody extends StatelessWidget {
  const CheckResultPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckResultPageCubit, CheckResultPageState>(
        builder: (context, state) {
      if (state is CheckResultPageShow) {
        return ResultPageTabController(
          first: ResultPageInitialText(text: state.text),
          second: Center(
            child: Container(
              margin: const EdgeInsets.only(top: 17, bottom: 17),
              child: CheckResultLinks(links: state.links),
            ),
          ),
        );
      } else {
        return const PageBody();
      }
    });
  }
}
