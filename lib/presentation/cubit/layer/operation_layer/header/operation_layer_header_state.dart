part of '../operation_layer.dart';

@immutable
abstract class OperationLayerHeaderState {
  final String title;

  const OperationLayerHeaderState(this.title);
}

class OperationLayerHeaderInitial extends OperationLayerHeaderState {
  const OperationLayerHeaderInitial(String title) : super(title);
}

class OperationLayerHeaderForeground extends OperationLayerHeaderState {
  final List<Widget> actions;

  final bool isActionsVisible;

  final void Function()? onClose;

  const OperationLayerHeaderForeground(
      String title, this.actions, this.isActionsVisible, this.onClose)
      : super(title);
}

class OperationLayerHeaderBackground extends OperationLayerHeaderState {
  final Color color;

  const OperationLayerHeaderBackground(String title, this.color) : super(title);
}
