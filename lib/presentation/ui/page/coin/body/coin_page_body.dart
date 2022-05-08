import 'package:flutter/material.dart';

import '../../page_body.dart';
import 'buttons/coin_page_body_buttons.dart';
import 'list/coin_page_body_list.dart';

class CoinPageBody extends StatelessWidget {
  const CoinPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBody(
        padding: const EdgeInsets.only(top: 40, bottom: 40),
        child: Column(
          children: const [
            Expanded(child: CoinPageBodyList()),
            CoinPageBodyButtons()
          ],
        ));
  }
}
