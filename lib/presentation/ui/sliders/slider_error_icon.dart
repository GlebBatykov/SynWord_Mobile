import 'package:flutter/material.dart';

import '../../asset/icon_asset.dart';

class SliderErrorIcon extends StatelessWidget {
  const SliderErrorIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(IconAsset.error, width: 20, height: 20);
  }
}
