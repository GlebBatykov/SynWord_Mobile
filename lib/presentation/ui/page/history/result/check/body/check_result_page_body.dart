import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:synword/presentation/ui/page/history/result/result_page_initial_text.dart';

import '../../../../../../asset/history_page_asset.dart';
import '../../../../../../cubit/page/history/result/check/check_result_page_cubit.dart';
import '../../../../../checked_link.dart';
import '../../../../page_body.dart';
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
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: RawScrollbar(
                      thickness: 1,
                      isAlwaysShown: true,
                      thumbColor: Colors.black.withOpacity(0.7),
                      crossAxisMargin: 5,
                      child: Container(
                        margin: const EdgeInsets.only(left: 24, right: 24),
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: state.links.length,
                            itemBuilder: (context, index) {
                              return CheckedLink(
                                  url: state.links[index].url,
                                  percentages: state.links[index].percentages);
                            }),
                      ))),
            ),
          ),
        );
      } else {
        return const PageBody();
      }
    });
  }
}
