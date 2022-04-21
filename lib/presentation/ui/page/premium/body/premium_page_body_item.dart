import 'package:flutter/material.dart';
import 'package:synword_flutter_cubit_application/presentation/asset/premium_page_asset.dart';

class PremiumPageBodyItem extends StatelessWidget {
  final String title;

  const PremiumPageBodyItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Row(children: [
          Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset(PremiumPageAsset.point)),
          Text(title, style: const TextStyle(fontSize: 13))
        ]));
  }
}
