part of '../operation_layer.dart';

@immutable
abstract class OperationLayerBodyState {}

class OperationLayerBodyInitial extends OperationLayerBodyState {}

class OperationLayerBodyLoad extends OperationLayerBodyState {}

class OperationLayerBodyPreparation extends OperationLayerBodyState {}

class OperationLayerBodyShow extends OperationLayerBodyState {
  final Widget content;

  OperationLayerBodyShow(this.content);
}
