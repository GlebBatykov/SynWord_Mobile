part of '../operation_layer.dart';

class OperationLayerHeaderCubit extends Cubit<OperationLayerHeaderState> {
  final String _title;

  final Color _color;

  final List<Widget> _actions;

  final bool _isActionsVisible;

  final void Function()? _onClose;

  OperationLayerHeaderCubit(String title, Color color,
      {List<Widget>? actions,
      bool isActionsVisible = true,
      void Function()? onClose})
      : _title = title,
        _color = color,
        _actions = actions ?? [],
        _isActionsVisible = isActionsVisible,
        _onClose = onClose,
        super(OperationLayerHeaderInitial(title)) {
    _initialize();
  }

  void _initialize() {
    emit(OperationLayerHeaderForeground(
        _title, _actions, _isActionsVisible, _onClose));
  }

  void toForeground() {
    emit(OperationLayerHeaderForeground(
        _title, _actions, _isActionsVisible, _onClose));
  }

  void toBackground() {
    emit(OperationLayerHeaderBackground(_title, _color));
  }
}
