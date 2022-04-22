import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'body/history_page_body.dart';
import 'title_bar/history_page_title_bar.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#301B28'),
      body: Column(
        children: const [
          HistoryPageTitleBar(),
          Expanded(child: HistoryPageBody())
        ],
      ),
    );
  }
}
