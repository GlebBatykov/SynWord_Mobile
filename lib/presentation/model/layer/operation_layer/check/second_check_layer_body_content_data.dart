import '../../../page/history/result/check/check_result_link.dart';
import '../../body/layer_body_content_data.dart';

class SecondCheckLayerBodyContentData extends LayerBodyContentData {
  final double sourceProgress;

  final double newProgress;

  final List<CheckResultLink> links;

  SecondCheckLayerBodyContentData(
      this.sourceProgress, this.newProgress, this.links);
}
