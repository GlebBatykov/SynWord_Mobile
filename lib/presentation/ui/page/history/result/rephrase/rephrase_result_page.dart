import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../pages_properties.dart';
import 'body/rephrase_result_page_body.dart';
import 'title_bar/rephrase_result_page_title_bar.dart';

class RephraseResultPage extends StatelessWidget {
  const RephraseResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#301B28'),
      body: Container(
        margin: PagesProperties.margin,
        child: Column(
          children: const [
            RephraseResultPageTitleBar(),
            Expanded(child: RephraseResultPageBody())
          ],
        ),
      ),
    );
  }
}
