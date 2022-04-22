import 'package:flutter/material.dart';

import '../../../../asset/premium_page_asset.dart';
import '../../page_title_bar_blured_board.dart';

class CoinPageBalanceBoard extends StatelessWidget {
  final int balance;

  const CoinPageBalanceBoard({Key? key, required this.balance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var minWidth = 136.0;

    var width = minWidth;

    var length = balance.toString().length;

    if (length > 4) {
      width += (length - 4) * 12.5;
    }

    return PageTitleBarBluredBoard(
        width: width,
        child: Container(
          margin: const EdgeInsets.only(left: 16, right: 16, bottom: 6, top: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('Balance',
                  style: TextStyle(
                      fontFamily: 'Isidora-Soft-Alt',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 7),
                      child: Text(balance.toString(),
                          style: const TextStyle(
                              fontFamily: 'Isidora-Soft-Alt',
                              fontWeight: FontWeight.w600,
                              fontSize: 26,
                              color: Colors.white))),
                  Image.asset(PremiumPageAsset.coins, width: 23, height: 23)
                ],
              )
            ],
          ),
        ));
  }
}
