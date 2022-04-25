import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:synword_flutter_cubit_application/presentation/asset/premium_page_asset.dart';

import '../premium_page_body_button.dart';
import '../premium_page_body_item.dart';

class PremiumpageBodyGoldSection extends StatelessWidget {
  const PremiumpageBodyGoldSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 258,
      height: 227,
      padding: const EdgeInsets.only(left: 12, right: 12, top: 17),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [HexColor('#ECE9E6'), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: HexColor('#DDC5A2'), width: 1),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: Colors.black.withOpacity(0.5),
                blurRadius: 4,
                spreadRadius: -2)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'GOLD',
                    style: TextStyle(
                        shadows: [
                          Shadow(
                              color: Colors.black.withOpacity(0.25),
                              offset: const Offset(0, 4),
                              blurRadius: 4)
                        ],
                        color: HexColor('#C99E10'),
                        fontFamily: 'Audrey',
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  )),
              const PremiumPageBodyItem(title: 'All Silver features'),
              const PremiumPageBodyItem(title: 'AI-based paraphraser'),
              const PremiumPageBodyItem(title: 'Unlimited characters limit'),
              Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Image.asset(PremiumPageAsset.point)),
                        const Text('50', style: TextStyle(fontSize: 13)),
                        Padding(
                            padding: const EdgeInsets.only(left: 3, right: 3),
                            child: Image.asset(PremiumPageAsset.coins,
                                width: 13, height: 13)),
                        const Text('per day for free',
                            style: TextStyle(fontSize: 13))
                      ])),
            ],
          ),
          PremiumPageBodyButton(
              title: 'Subscribe for \$10 per month',
              color: HexColor('#dbb432').withOpacity(0.56))
        ],
      ),
    );
  }
}
