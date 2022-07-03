import '../../../../../cubit/rephrased_text/rephrased_text_cubit.dart';
import '../../../body/layer_body_content_data.dart';

abstract class RephraseLayerBodyContentData
    extends OperationLayerBodyContentData {}

class RephraseLayerBodyRephraseData extends RephraseLayerBodyContentData {
  final RephrasedTextCubit rephrasedTextCubit;

  RephraseLayerBodyRephraseData(this.rephrasedTextCubit);
}

class RephraseLayerBodyEnhancedRephraseData
    extends RephraseLayerBodyContentData {
  final String text;

  RephraseLayerBodyEnhancedRephraseData(this.text);
}
