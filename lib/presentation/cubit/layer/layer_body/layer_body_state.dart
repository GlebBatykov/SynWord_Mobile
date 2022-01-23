part of 'layer_body_cubit.dart';

@immutable
abstract class LayerBodyState {}

class LayerBodyInitial extends LayerBodyState {}

class LayerBodyLoad extends LayerBodyState {}

class LayerBodyShow extends LayerBodyState {
  final Widget? content;

  LayerBodyShow(this.content);
}
