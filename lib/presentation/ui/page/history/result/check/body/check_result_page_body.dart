import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../page_body.dart';

class CheckResultPageBody extends StatelessWidget {
  const CheckResultPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 33, right: 33, bottom: 4),
              child: TabBar(indicatorColor: HexColor('B6452C'), tabs: const [
                Tab(
                  child: Icon(Icons.abc),
                ),
                Tab(
                  child: Icon(Icons.abc_rounded),
                )
              ]),
            ),
            const Expanded(
                child: PageBody(
                    child: TabBarView(children: [
              Center(
                child: Text('1'),
              ),
              Center(
                child: Text('2'),
              )
            ])))
          ],
        ));
  }
}
