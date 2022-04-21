import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../../asset/coin_page_asset.dart';
import 'coin_page_body_list_item_cart.dart';

class CoinPageBodyListItem extends StatelessWidget {
  final EdgeInsets? margin;

  const CoinPageBodyListItem({Key? key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 242,
      height: 54,
      margin: margin ?? EdgeInsets.zero,
      padding: const EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 4),
                blurRadius: 5)
          ],
          border: Border.all(color: HexColor('#A5538E'), width: 1),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(CoinPageAsset.coins, width: 30, height: 30),
          const Text('100 coins', style: TextStyle(fontSize: 16)),
          const CoinPageBodyListItemCart()
        ],
      ),
    );
  }
}
