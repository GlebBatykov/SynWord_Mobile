import 'package:flutter/material.dart';

import '../../../../asset/icon_asset.dart';

class LayerHeaderCopyButton extends StatelessWidget {
  const LayerHeaderCopyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(IconAsset.copy, width: 25, height: 25);
  }
}
