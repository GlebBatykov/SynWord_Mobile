part of '../operation_layer.dart';

@immutable
abstract class OperationLayerBodyState {}

class OperationLayerBodyInitial extends OperationLayerBodyState {}

class OperationLayerBodyLoad extends OperationLayerBodyState {}

class OperationLayerBodyPreparation extends OperationLayerBodyState {
  final Widget content;

  OperationLayerBodyPreparation(this.content);
}

class OperationLayerBodyResult extends OperationLayerBodyState {
  final Widget content;

  OperationLayerBodyResult(this.content);
}
