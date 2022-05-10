import 'package:flutter/material.dart';

import '../../../../asset/icon_asset.dart';
import '../../../button/image_button.dart';

class RephraseLayerCubitCopyButton extends StatelessWidget {
  final void Function()? onTap;

  const RephraseLayerCubitCopyButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageButton(
        assetPath: IconAsset.copy,
        imageHeight: 25,
        imageWidth: 25,
        height: 35,
        width: 35,
        onTap: onTap);
  }
}
