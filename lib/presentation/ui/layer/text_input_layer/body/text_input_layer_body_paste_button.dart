import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../asset/icon_asset.dart';
import '../../../../cubit/layer/text_input_layer/body/paste_button/text_input_layer_body_paste_button_cubit.dart';
import '../../../image_button.dart';

class TextInputLayerBodyPasteButton extends StatelessWidget {
  const TextInputLayerBodyPasteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextInputLayerBodyPasteButtonCubit,
        TextInputLayerBodyPasteButtonState>(builder: (context, state) {
      return state is TextInputLayerBodyPasteButtonVisible
          ? ImageButton(
              assetPath: IconAsset.paste,
              imageWidth: 25,
              imageHeight: 25,
              width: 40,
              height: 40,
              onTap: () {},
              imageColor: Colors.black.withOpacity(0.6))
          : Container();
    });
  }
}
