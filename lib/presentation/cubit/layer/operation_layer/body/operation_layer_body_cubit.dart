part of '../operation_layer.dart';

typedef ContentBuilder<T> = Widget Function(T);

class OperationLayerBodyCubit<T extends OperationLayerBodyContentData>
    extends Cubit<OperationLayerBodyState> {
  final ContentBuilder<T>? _builder;

  OperationLayerBodyCubit({ContentBuilder<T>? builder})
      : _builder = builder,
        super(OperationLayerBodyInitial()) {
    _initialize();
  }

  void _initialize() {}

  void load() {
    emit(OperationLayerBodyLoad());
  }

  void show(T data) {
    late Widget content;

    if (_builder != null) {
      content = _builder!.call(data);
    } else {
      content = Container();
    }

    emit(OperationLayerBodyShow(content));
  }
}
