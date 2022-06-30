import 'package:flutter/material.dart';

import '../../../asset/icon_asset.dart';
import 'rounded_button.dart';

class RoundedAccountButton extends StatelessWidget {
  final void Function()? onTap;

  const RoundedAccountButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
        icon: Padding(
            padding:
                const EdgeInsets.only(left: 8, bottom: 8, right: 7, top: 7),
            child: Image.asset(IconAsset.account, width: 25, height: 25)),
        onTap: onTap);
  }
}
