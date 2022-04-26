import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/checked_link.dart';

import '../../../../../../asset/history_page_asset.dart';
import '../../../../../../cubit/page/history/result/check/check_result_page_cubit.dart';
import '../../../../page_body.dart';

class CheckResultPageBody extends StatelessWidget {
  const CheckResultPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckResultPageCubit, CheckResultPageState>(
        builder: (context, state) {
      if (state is CheckResultPageShow) {
        return DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 33, right: 33, bottom: 4),
                  child: TabBar(indicatorColor: HexColor('B6452C'), tabs: [
                    Tab(
                      child: Image.asset(HistoryPageAsset.note,
                          width: 30, height: 30),
                    ),
                    Tab(
                      child: Image.asset(HistoryPageAsset.website,
                          width: 30, height: 30),
                    )
                  ]),
                ),
                Expanded(
                    child: PageBody(
                        child: TabBarView(children: [
                  Container(
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
                              margin:
                                  const EdgeInsets.only(left: 13, right: 13),
                              child: SingleChildScrollView(
                                  child: SelectableText(state.text,
                                      style: const TextStyle(fontSize: 16))),
                            ))),
                  ),
                  Center(
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
                                margin:
                                    const EdgeInsets.only(left: 24, right: 24),
                                child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: state.links.length,
                                    itemBuilder: (context, index) {
                                      return CheckedLink(
                                          url: state.links[index].url,
                                          percentages:
                                              state.links[index].percentages);
                                    }),
                              ))),
                    ),
                  )
                ])))
              ],
            ));
      } else {
        return Container();
      }
    });
  }
}
