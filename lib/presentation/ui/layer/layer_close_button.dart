import 'package:flutter/material.dart';

import '../../asset/icon_asset.dart';
import '../button/image_button.dart';

class LayerCloseButton extends StatelessWidget {
  final void Function()? onTap;

  const LayerCloseButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageButton(
      onTap: onTap,
      assetPath: IconAsset.close,
      imageWidth: 20,
      imageHeight: 20,
      width: 30,
      height: 30,
    );
  }
}
