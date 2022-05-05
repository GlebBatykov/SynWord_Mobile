import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../model/layer/operation_layer/check/check_layer_body_content_data.dart';
import '../../../../ui/layer/operation_layer/check/check_layer_body.dart';
import '../../layer/layer_cubit.dart';

class CheckLayerCubit extends LayerCubit<CheckLayerBodyContentData> {
  CheckLayerCubit(Offset offset, Size size)
      : super('Plagiarism Checker', HexColor('DDC5A2'), offset, size,
            bodyBuilder: (data) => CheckLayerBody(data: data));
}
