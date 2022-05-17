part of '../operation_layer.dart';

@immutable
abstract class OperationLayerHeaderState {
  final String title;

  const OperationLayerHeaderState(this.title);
}

class OperationLayerHeaderInitial extends OperationLayerHeaderState {
  const OperationLayerHeaderInitial(super.title);
}

class OperationLayerHeaderForeground extends OperationLayerHeaderState {
  final List<Widget> actions;

  final bool isActionsVisible;

  final void Function()? onClose;

  final void Function(DragUpdateDetails) onVerticalDragUpdate;

  final void Function(DragEndDetails) onVerticalDragEnd;

  const OperationLayerHeaderForeground(
      super.title,
      this.actions,
      this.isActionsVisible,
      this.onClose,
      this.onVerticalDragUpdate,
      this.onVerticalDragEnd);
}

class OperationLayerHeaderBackground extends OperationLayerHeaderState {
  final Color color;

  final void Function(DragUpdateDetails) onVerticalDragUpdate;

  final void Function(DragEndDetails) onVerticalDragEnd;

  const OperationLayerHeaderBackground(super.title, this.color,
      this.onVerticalDragUpdate, this.onVerticalDragEnd);
}
