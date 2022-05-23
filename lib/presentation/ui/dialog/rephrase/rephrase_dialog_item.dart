import 'package:flutter/material.dart';

import '../../../asset/premium_page_asset.dart';

class RephraseDialogItem extends StatelessWidget {
  final String title;

  final String? subtitle;

  final int price;

  const RephraseDialogItem(
      {super.key, required this.title, this.subtitle, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 12)),
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(price.toString(),
                          style: const TextStyle(fontSize: 16))),
                  Image.asset(PremiumPageAsset.coins, width: 20, height: 20)
                ],
              )
            ],
          ),
          if (subtitle != null)
            Padding(
                padding: const EdgeInsets.only(top: 9),
                child: Text('* ${subtitle!}',
                    style: TextStyle(
                        fontSize: 8, color: Colors.black.withOpacity(0.5))))
        ],
      ),
    );
  }
}
