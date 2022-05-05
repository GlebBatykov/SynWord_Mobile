part of 'layer_body_cubit.dart';

@immutable
abstract class LayerBodyState {}

class LayerBodyInitial extends LayerBodyState {}

class LayerBodyLoad extends LayerBodyState {}

class LayerBodyShow<T extends LayerBodyContentData> extends LayerBodyState {
  final ContentBuilder<T>? builder;

  final T data;

  LayerBodyShow(this.builder, this.data);
}
