import '../../../../cubit/rephrased_text/rephrased_text_cubit.dart';
import '../../body/layer_body_content_data.dart';

class RephraseLayerBodyContentData extends OperationLayerBodyContentData {
  final RephrasedTextCubit rephrasedTextCubit;

  RephraseLayerBodyContentData(this.rephrasedTextCubit);
}
