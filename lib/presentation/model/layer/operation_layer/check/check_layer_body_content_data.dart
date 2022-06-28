import 'package:flutter/material.dart';

import '../../../../../domain/model/result/check/check_result_check_result_link.dart';
import '../../body/layer_body_content_data.dart';

class CheckLayerBodyContentData extends OperationLayerBodyContentData {
  final Size layerSize;

  final double progress;

  final List<CheckResultCheckResultLink> links;

  CheckLayerBodyContentData(this.layerSize, this.progress, this.links);
}
