import 'package:flutter/material.dart';

import '../../../../asset/icon_asset.dart';
import '../../../button/image_button.dart';

class TextInputLayerHeaderCopyButton extends StatelessWidget {
  final void Function()? onTap;

  const TextInputLayerHeaderCopyButton({Key? key, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageButton(
        assetPath: IconAsset.paste,
        imageWidth: 20,
        imageHeight: 20,
        width: 30,
        height: 30,
        onTap: onTap,
        imageColor: Colors.black);
  }
}
