import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../model/layer/operation_layer/rephrase/rephrase_layer_body_preparation_data.dart';

class RephraseLayerPreparation extends StatelessWidget {
  final RephraseLayerBodyPreparationData data;

  const RephraseLayerPreparation({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 218,
          height: 147,
          margin: const EdgeInsets.only(bottom: 26, top: 9),
          decoration: BoxDecoration(
              border: Border.all(
                color: HexColor('#DDC5A2'),
              ),
              borderRadius: BorderRadius.circular(5)),
        ),
        Container(
          width: 218,
          height: 147,
          decoration: BoxDecoration(
              border: Border.all(
                color: HexColor('#DDC5A2'),
              ),
              borderRadius: BorderRadius.circular(5)),
        )
      ],
    );
  }
}
