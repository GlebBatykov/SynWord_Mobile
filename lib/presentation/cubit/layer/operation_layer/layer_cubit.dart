part of 'operation_layer.dart';

abstract class OperationLayerCubit<T extends OperationLayerBodyContentData>
    extends Cubit<OperationLayerState> {
  late final OperationLayerHeaderCubit _headerCubit;

  late final OperationLayerBodyCubit<T> _bodyCubit;

  Offset _offset;

  Size _size;

  OperationLayerCubit(Offset offset, Size size)
      : _offset = offset,
        _size = size,
        super(OperationLayerInitial(offset, size)) {
    _initialize();
  }

  void _initialize();

  FutureOr<void> work();

  void show(T data) {
    _bodyCubit.show(data);
  }

  void move(Offset offset) {
    _offset += offset;

    _show();
  }

  void load() {
    _bodyCubit.load();
  }

  void _show() {
    emit(OperationLayerShow(_headerCubit, _bodyCubit, _offset, _size));
  }
}
