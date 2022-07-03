part of 'operation_layer.dart';

abstract class OperationLayerCubit<T extends OperationLayerBodyContentData,
    P extends LayerBodyPreparationData> extends Cubit<OperationLayerState> {
  final StreamController<AnimationEndDetails> _onAnimationEndController =
      StreamController.broadcast();

  final StreamController _workDoneController = StreamController.broadcast();

  final void Function()? _onClose;

  late final OperationLayerHeaderCubit _headerCubit;

  late final OperationLayerBodyCubit<T, P> _bodyCubit;

  Offset _offset;

  Size _size;

  Duration _duration;

  Offset get offset => _offset;

  Size get size => _size;

  Stream<Offset> get verticalDragUpdate => _headerCubit.verticalDragUpdate;

  Stream<double> get verticalDragEnd => _headerCubit.verticalDragEnd;

  Stream<AnimationEndDetails> get onAnimationEnd =>
      _onAnimationEndController.stream;

  Stream get workDone => _workDoneController.stream;

  OperationLayerCubit(Offset offset, Size size, {void Function()? onClose})
      : _offset = offset,
        _size = size,
        _onClose = onClose,
        _duration = const Duration(),
        super(OperationLayerInitial()) {
    _initialize();
  }

  void _initialize();

  FutureOr<void> initialize() {}

  FutureOr<void> work() async {
    _workDoneController.sink.add(null);
  }

  void showResult(T data) {
    _bodyCubit.showResult(data);
  }

  void showPreparationPage(P data) {
    _bodyCubit.showPreparationPage(data);
  }

  void load() {
    _bodyCubit.load();
  }

  void toBackground() {
    _headerCubit.toBackground();
  }

  void toForeground() {
    _headerCubit.toForeground();
  }

  void setOffset(Offset value) {
    _offset = value;
  }

  void setSize(Size value) {
    _size = value;
  }

  void setMoveDuration() {
    _duration = const Duration();
  }

  void setAnimationDuration() {
    _duration = const Duration(milliseconds: 300);
  }

  void update() {
    _show();
  }

  void _show() {
    emit(OperationLayerShow(
        _headerCubit, _bodyCubit, _offset, _size, _duration, _onAnimationEnd));
  }

  void _onAnimationEnd() {
    _onAnimationEndController.sink.add(AnimationEndDetails(_offset));
  }

  @override
  Future<void> close() async {
    await _onAnimationEndController.close();
    await _workDoneController.close();

    return super.close();
  }
}
