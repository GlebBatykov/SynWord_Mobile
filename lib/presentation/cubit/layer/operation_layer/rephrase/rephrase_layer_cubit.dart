import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../model/layer/operation_layer/rephrase/rephrase_layer_body_content_data.dart';
import '../../../../ui/layer/operation_layer/rephrase/rephrase_layer_body.dart';
import '../../layer/layer_cubit.dart';

class RephraseLayerCubit extends LayerCubit<RephraseLayerBodyContentData> {
  RephraseLayerCubit(Offset offset, Size size)
      : super('Plagiarism Checker', HexColor('DDC5A2'), offset, size,
            bodyBuilder: (data) => RephraseLayerBody(data: data));

  @override
  void work() {
    show(RephraseLayerBodyContentData());
  }
}
