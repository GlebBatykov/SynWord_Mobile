import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../../asset/coin_page_asset.dart';

class CoinPageBodyListItemCart extends StatelessWidget {
  const CoinPageBodyListItemCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 5,
            offset: const Offset(0, 4),
            color: Colors.black.withOpacity(0.25))
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
            height: 36,
            width: 62,
            color: HexColor('#F44336'),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 6, bottom: 6, left: 7, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(CoinPageAsset.cart, width: 20, height: 20),
                      Column(
                        children: const [
                          Text('UAH',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                          Text('17.99',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
