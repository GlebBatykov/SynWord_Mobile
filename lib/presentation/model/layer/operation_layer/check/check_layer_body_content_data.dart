import '../../../page/history/result/check/check_result_link.dart';
import '../../body/layer_body_content_data.dart';

class CheckLayerBodyContentData extends OperationLayerBodyContentData {
  final double progress;

  final List<CheckResultLink> links;

  CheckLayerBodyContentData(this.progress, this.links);
}
