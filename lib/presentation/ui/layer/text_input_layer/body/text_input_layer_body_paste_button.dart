import 'package:flutter/material.dart';

import '../../../../asset/icon_asset.dart';
import '../../../button/image_button.dart';

class TextInputLayerBodyPasteButton extends StatelessWidget {
  final void Function()? onTap;

  const TextInputLayerBodyPasteButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageButton(
        assetPath: IconAsset.paste,
        imageWidth: 25,
        imageHeight: 25,
        width: 40,
        height: 40,
        imageColor: Colors.black.withOpacity(0.6),
        onTap: onTap);
  }
}
