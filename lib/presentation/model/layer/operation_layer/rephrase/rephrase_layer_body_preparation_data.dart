import '../../../../cubit/layer/operation_layer/operation_layer.dart';
import '../../body/layer_body_preparation_data.dart';

class RephraseLayerBodyPreparationData extends LayerBodyPreparationData {
  final int coins;

  final int rephasePrice;

  final int enhancedRephrasePrice;

  final RephraseLayerCubit layerCubit;

  RephraseLayerBodyPreparationData(this.coins, this.rephasePrice,
      this.enhancedRephrasePrice, this.layerCubit);
}
