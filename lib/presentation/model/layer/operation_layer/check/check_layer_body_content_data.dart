import 'package:flutter/material.dart';

import '../../../../../domain/model/check/check_result_link.dart';
import '../../body/layer_body_content_data.dart';

class CheckLayerBodyContentData extends OperationLayerBodyContentData {
  final Size layerSize;

  final double progress;

  final List<CheckResultLink> links;

  CheckLayerBodyContentData(this.layerSize, this.progress, this.links);
}
