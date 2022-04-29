import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../asset/history_page_asset.dart';
import '../../page_body.dart';

class ResultPageTabController extends StatelessWidget {
  final Widget first;

  final Widget second;

  const ResultPageTabController(
      {Key? key, required this.first, required this.second})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 33, right: 33, bottom: 4),
              child: TabBar(indicatorColor: HexColor('B6452C'), tabs: [
                Tab(
                  child:
                      Image.asset(HistoryPageAsset.note, width: 30, height: 30),
                ),
                Tab(
                  child: Image.asset(HistoryPageAsset.website,
                      width: 30, height: 30),
                )
              ]),
            ),
            Expanded(
                child: PageBody(child: TabBarView(children: [first, second])))
          ],
        ));
  }
}
