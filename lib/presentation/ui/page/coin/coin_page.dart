import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../pages_properties.dart';
import 'body/coin_page_body.dart';
import 'title_bar/coin_page_title_bar.dart';

class CoinPage extends StatelessWidget {
  const CoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HexColor('#301B28'),
      body: Container(
        margin: PagesProperties.margin,
        child: Column(
          children: const [CoinPageTitleBar(), Expanded(child: CoinPageBody())],
        ),
      ),
    );
  }
}
