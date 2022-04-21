import 'package:flutter/material.dart';

import 'item/coin_page_body_list_item.dart';

class CoinPageBodyList extends StatelessWidget {
  const CoinPageBodyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const margin = EdgeInsets.only(bottom: 29);

    return Column(
      children: const [
        CoinPageBodyListItem(margin: margin),
        CoinPageBodyListItem(margin: margin),
        CoinPageBodyListItem(margin: margin),
        CoinPageBodyListItem()
      ],
    );
  }
}
