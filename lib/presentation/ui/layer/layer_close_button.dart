import 'package:flutter/material.dart';

import '../../asset/icon_asset.dart';

class LayerCloseButton extends StatelessWidget {
  const LayerCloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(IconAsset.close, width: 20, height: 20);
  }
}
