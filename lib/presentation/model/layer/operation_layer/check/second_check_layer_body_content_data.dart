import 'package:flutter/material.dart';

import '../../../../../domain/model/result/check/check_result_check_result_link.dart';
import '../../body/layer_body_content_data.dart';

class SecondCheckLayerBodyContentData extends OperationLayerBodyContentData {
  final Size layerSize;

  final double sourceProgress;

  final double newProgress;

  final List<CheckResultCheckResultLink> links;

  SecondCheckLayerBodyContentData(
      this.layerSize, this.sourceProgress, this.newProgress, this.links);
}
