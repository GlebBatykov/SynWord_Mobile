import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../asset/coin_page_asset.dart';
import 'coin_page_body_button.dart';

class CoinPageBodyButtons extends StatelessWidget {
  const CoinPageBodyButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const margin = EdgeInsets.only(right: 29);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CoinPageBodyButton(
            margin: margin,
            imageAsset: CoinPageAsset.info,
            color: HexColor('#DDC5A2')),
        CoinPageBodyButton(
            margin: margin,
            imageAsset: CoinPageAsset.giftBox,
            color: HexColor('#95547D')),
        CoinPageBodyButton(
            imageAsset: CoinPageAsset.premium, color: HexColor('#DDC5A2'))
      ],
    );
  }
}
