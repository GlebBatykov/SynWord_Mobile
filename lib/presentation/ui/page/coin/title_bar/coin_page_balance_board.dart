import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:blur/blur.dart';
import 'package:synword_flutter_cubit_application/presentation/asset/premium_page_asset.dart';

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

    return Container(
        width: width,
        height: 80,
        decoration: BoxDecoration(
            color: HexColor('#634357'),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 15,
                  color: Colors.black.withOpacity(0.25))
            ]),
        child: Stack(
          children: [
            Container(
                    margin: const EdgeInsets.only(
                        left: 16, right: 16, bottom: 6, top: 8),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [HexColor('#C0392B'), HexColor('#8E44AD')]),
                        borderRadius: BorderRadius.circular(15)))
                .blurred(
                    blur: 15,
                    borderRadius: BorderRadius.circular(15),
                    blurColor: Colors.white,
                    colorOpacity: 0.12),
            Container(
              margin:
                  const EdgeInsets.only(left: 16, right: 16, bottom: 6, top: 8),
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
            )
          ],
        ));
  }
}
