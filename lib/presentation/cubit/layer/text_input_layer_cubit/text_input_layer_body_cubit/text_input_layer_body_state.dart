part of 'text_input_layer_body_cubit.dart';

@immutable
abstract class TextInputLayerBodyState {}

class TextInputLayerBodyInitial extends TextInputLayerBodyState {}

class TextInputLayerBodyEmpty extends TextInputLayerBodyState {
  final TextEditingController editingController;

  TextInputLayerBodyEmpty(this.editingController);
}

class TextInputLayerBodyNotEmpty extends TextInputLayerBodyState {
  final TextEditingController editingController;

  TextInputLayerBodyNotEmpty(this.editingController);
}
