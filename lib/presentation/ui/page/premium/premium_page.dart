import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../pages_properties.dart';
import 'body/premium_page_body.dart';
import 'premium_page_title_bar.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#301B28'),
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: PagesProperties.margin,
        child: Column(
          children: const [
            PremiumPageTitleBar(),
            Expanded(child: PremiumPageBody())
          ],
        ),
      ),
    );
  }
}
