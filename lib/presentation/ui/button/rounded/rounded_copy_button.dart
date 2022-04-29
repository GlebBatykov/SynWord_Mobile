import 'package:flutter/material.dart';

import '../../../asset/history_page_asset.dart';
import 'rounded_button.dart';

class RoundedCopyButton extends StatelessWidget {
  const RoundedCopyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      onTap: () {},
      icon: Padding(
          padding: const EdgeInsets.only(left: 8, top: 8, right: 7, bottom: 7),
          child: Image.asset(HistoryPageAsset.copy)),
    );
  }
}
