import 'package:flutter/cupertino.dart';

import '../../../../../asset/premium_page_asset.dart';

class RephraseLayerPreparationSectionItem extends StatelessWidget {
  final String title;

  const RephraseLayerPreparationSectionItem({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Row(children: [
          Padding(
              padding: const EdgeInsets.only(right: 8),
              child:
                  Image.asset(PremiumPageAsset.point, width: 10, height: 10)),
          Text(title, style: const TextStyle(fontSize: 13))
        ]));
  }
}
