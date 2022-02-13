import 'package:flutter/material.dart';

import 'section/premium_page_body_gold_section.dart';
import 'section/premium_page_body_silver_section.dart';

class PremiumPageBody extends StatelessWidget {
  const PremiumPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: LayoutBuilder(builder: ((context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              PremiumPageBodySilverSection(),
              PremiumpageBodyGoldSection(),
            ],
          ),
        );
      })),
    );
  }
}
