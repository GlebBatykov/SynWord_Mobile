import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/page/pages_properties.dart';

import 'body/coin_page_body.dart';
import 'title_bar/coin_page_title_bar.dart';

class CoinPage extends StatelessWidget {
  const CoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
