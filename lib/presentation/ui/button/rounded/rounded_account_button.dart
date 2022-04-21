import 'package:flutter/material.dart';

import '../../../asset/icon_asset.dart';
import 'rounded_button.dart';

class RoundedAccountButton extends StatelessWidget {
  const RoundedAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
        icon: Image.asset(IconAsset.account, width: 25, height: 25),
        onTap: () {});
  }
}
