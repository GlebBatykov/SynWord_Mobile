import 'package:flutter/material.dart';

import '../../../asset/history_page_asset.dart';
import 'rounded_button.dart';

class RoundedCopyButton extends StatelessWidget {
  final void Function()? onTap;

  const RoundedCopyButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      onTap: onTap,
      icon: Padding(
          padding: const EdgeInsets.only(left: 8, top: 8, right: 7, bottom: 7),
          child: Image.asset(HistoryPageAsset.copy)),
    );
  }
}
