part of '../operation_layer.dart';

typedef ContentBuilder<T> = Widget Function(T);

typedef PreparationPageBuilder<T> = Widget Function(T);

class OperationLayerBodyCubit<T extends OperationLayerBodyContentData,
    P extends LayerBodyPreparationData> extends Cubit<OperationLayerBodyState> {
  final ContentBuilder<T>? _resultBuilder;

  final PreparationPageBuilder<P>? _preparationPageBuilder;

  OperationLayerBodyCubit(
      {ContentBuilder<T>? resultBuilder,
      PreparationPageBuilder<P>? preparationPageBuilder})
      : _resultBuilder = resultBuilder,
        _preparationPageBuilder = preparationPageBuilder,
        super(OperationLayerBodyInitial()) {
    _initialize();
  }

  void _initialize() {}

  void load() {
    emit(OperationLayerBodyLoad());
  }

  void showPreparationPage(P data) {
    late Widget content;

    if (_preparationPageBuilder != null) {
      content = _preparationPageBuilder!.call(data);
    } else {
      content = Container();
    }

    emit(OperationLayerBodyPreparation(content));
  }

  void showResult(T data) {
    late Widget content;

    if (_resultBuilder != null) {
      content = _resultBuilder!.call(data);
    } else {
      content = Container();
    }

    emit(OperationLayerBodyResult(content));
  }
}
