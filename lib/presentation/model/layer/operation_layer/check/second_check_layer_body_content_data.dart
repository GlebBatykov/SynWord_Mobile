import 'package:flutter/material.dart';

import '../../../../../domain/model/check/check_result_link.dart';
import '../../body/layer_body_content_data.dart';

class SecondCheckLayerBodyContentData extends OperationLayerBodyContentData {
  final Size layerSize;

  final double sourceProgress;

  final double newProgress;

  final List<CheckResultLink> links;

  SecondCheckLayerBodyContentData(
      this.layerSize, this.sourceProgress, this.newProgress, this.links);
}
