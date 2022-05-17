part of '../operation_layer.dart';

class OperationLayerHeaderCubit extends Cubit<OperationLayerHeaderState> {
  final StreamController<Offset> _onVerticalDragUpdateController =
      StreamController.broadcast();

  final StreamController<double> _onVerticalDragEndController =
      StreamController.broadcast();

  final String _title;

  final Color _color;

  final List<Widget> _actions;

  final bool _isActionsVisible;

  final void Function()? _onClose;

  Stream<Offset> get verticalDragUpdate =>
      _onVerticalDragUpdateController.stream;

  Stream<double> get verticalDragEnd => _onVerticalDragEndController.stream;

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
    emit(OperationLayerHeaderForeground(_title, _actions, _isActionsVisible,
        _onClose, _onVerticalDragUpdate, _onVerticalDragEnd));
  }

  void toForeground() {
    emit(OperationLayerHeaderForeground(_title, _actions, _isActionsVisible,
        _onClose, _onVerticalDragUpdate, _onVerticalDragEnd));
  }

  void toBackground() {
    emit(OperationLayerHeaderBackground(
        _title, _color, _onVerticalDragUpdate, _onVerticalDragEnd));
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    _onVerticalDragUpdateController.sink.add(details.delta);
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    _onVerticalDragEndController.sink.add(details.primaryVelocity ?? 0);
  }

  @override
  Future<void> close() async {
    await _onVerticalDragUpdateController.close();
    await _onVerticalDragEndController.close();

    return super.close();
  }
}
