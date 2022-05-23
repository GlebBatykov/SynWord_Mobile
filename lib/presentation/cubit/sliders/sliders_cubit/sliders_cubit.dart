import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../model/sliders/slider_coordinate.dart';
import '../../../ui/layer/layer_properties.dart';
import '../../../ui/sliders/slider_properties.dart';
import '../slider_cubit/slider_cubit.dart';

part 'sliders_state.dart';

class SlidersCubit extends Cubit<SlidersState> {
  static const double _leftSliderInitialLeftCoordinate = -36;

  static const double _rightSliderInitialRightCoordinate = -36;

  final StreamController _leftSliderAnimationEndController =
      StreamController.broadcast();

  final StreamController _rightSliderAnimationEndController =
      StreamController.broadcast();

  final StreamController<bool> _leftSliderMovingChangeController =
      StreamController.broadcast();

  final StreamController<bool> _rightSliderMovingChangeController =
      StreamController.broadcast();

  late final double _sliderEndBorder;

  final Size _size;

  late final SliderCubit _leftSliderCubit;

  late final SliderCubit _rightSliderCubit;

  bool _isLeftSliderEnabled = true;

  bool _isRightSliderEnabled = true;

  bool _isLeftSliderLocked = true;

  bool _isRightSliderLocked = true;

  bool _isLeftSliderMoving = false;

  bool _isRightSliderMoving = false;

  bool _isAnimationActive = false;

  Stream get leftSliderAnimationEnd => _leftSliderAnimationEndController.stream;

  Stream get rightSliderAnimationEnd =>
      _rightSliderAnimationEndController.stream;

  Stream<bool> get leftSliderMovingChange =>
      _leftSliderMovingChangeController.stream;

  Stream<bool> get rightSliderMovingChange =>
      _rightSliderMovingChangeController.stream;

  SlidersCubit(Size size)
      : _size = size,
        super(const SlidersInitial()) {
    _initialize();
  }

  void _initialize() {
    _sliderEndBorder = _size.width - SliderProperties.sliderWidth + 10;

    _initializeLeftSliderCubit();

    _initializeRightSliderCubit();

    _leftSliderCubit.horizontalDragUpdate
        .listen(_handleLeftSliderHorizontalDragUpdate);

    _leftSliderCubit.horizontalDragEnd
        .listen(_handleLeftSliderHorizontalDragEnd);

    _rightSliderCubit.horizontalDragUpdate
        .listen(_handleRightSliderHorizontalDragUpdate);

    _rightSliderCubit.horizontalDragEnd
        .listen(_handleRightSliderHorizontalDragEnd);

    _show();
  }

  void _initializeLeftSliderCubit() {
    var offset = const Offset(0, LayerProperties.headerContactHeight);

    var size = _getInitialLayerSize();

    var coordinate = _getLeftSliderInitialCoordinate();

    _leftSliderCubit =
        SliderCubit(AnimatedLayerType.check, coordinate, size, offset);
  }

  void _initializeRightSliderCubit() {
    var offset = Offset(_size.width - 10, LayerProperties.headerContactHeight);

    var size = _getInitialLayerSize();

    var coordinate = _getRightSliderInitialCoordinate();

    _rightSliderCubit =
        SliderCubit(AnimatedLayerType.rephrase, coordinate, size, offset);
  }

  SliderCoordinate _getLeftSliderInitialCoordinate() {
    return SliderCoordinate(left: _leftSliderInitialLeftCoordinate, bottom: 50);
  }

  SliderCoordinate _getRightSliderInitialCoordinate() {
    return SliderCoordinate(
        right: _rightSliderInitialRightCoordinate, bottom: 50);
  }

  Size _getInitialLayerSize() {
    return Size(
        _size.width, _size.height - LayerProperties.headerContactHeight);
  }

  void _handleLeftSliderHorizontalDragUpdate(Offset delta) {
    if (_isLeftSliderLocked && !_isAnimationActive) {
      if (delta.dx > 0 && _leftSliderCubit.coordinate.left < _sliderEndBorder) {
        var coordinate = _createNewLeftSliderCoordinate(delta);

        var opacity = _calculateNewLeftSliderOpacity(coordinate);

        _leftSliderCubit.setCoordinate(coordinate);
        _leftSliderCubit.setOpacity(opacity);

        _rightSliderCubit.setOpacity(opacity);

        _leftSliderCubit.update();
        _rightSliderCubit.update();
      }

      if (!_isLeftSliderMoving) {
        _isLeftSliderMoving = true;

        _leftSliderMovingChangeController.sink.add(true);
      }
    }
  }

  SliderCoordinate _createNewLeftSliderCoordinate(Offset delta) {
    var left = _leftSliderCubit.coordinate.left + delta.dx;

    if (left > _sliderEndBorder) {
      left = _sliderEndBorder;
    }

    return SliderCoordinate(
        left: left,
        right: _leftSliderCubit.coordinate.right,
        top: _leftSliderCubit.coordinate.top,
        bottom: _leftSliderCubit.coordinate.bottom);
  }

  double _calculateNewLeftSliderOpacity(SliderCoordinate coordinate) {
    const rightCalculatePart = _leftSliderInitialLeftCoordinate +
        SliderProperties.sliderWidth * 2 -
        40;

    var opactity =
        (_size.width - coordinate.left - rightCalculatePart) / _size.width;

    return opactity > 0 ? opactity : 0;
  }

  void _handleLeftSliderHorizontalDragEnd(double _) async {
    if (_isLeftSliderLocked && !_isAnimationActive) {
      if (!_isLeftSliderMoving) {
        _rightSliderMovingChangeController.sink.add(true);
      }

      if (_leftSliderCubit.coordinate.left < _sliderEndBorder) {
        _isAnimationActive = true;

        var coordinate = _createEndLeftSliderCoordinate();

        _leftSliderCubit.setCoordinate(coordinate);
        _leftSliderCubit.setAnimationDuration();
        _leftSliderCubit.setOpacity(0);

        _rightSliderCubit.setAnimationDuration();
        _rightSliderCubit.setOpacity(0);

        _leftSliderCubit.update();
        _rightSliderCubit.update();

        await Future.wait([
          _leftSliderCubit.onOpacityAnimationEnd.first,
          _leftSliderCubit.onPositionedAnimaionEnd.first,
          _rightSliderCubit.onOpacityAnimationEnd.first
        ]);

        _leftSliderCubit.setMoveDuration();
        _rightSliderCubit.setMoveDuration();

        _leftSliderCubit.update();
        _rightSliderCubit.update();

        _leftSliderAnimationEndController.sink.add(null);

        _isAnimationActive = false;
      } else {
        _leftSliderAnimationEndController.sink.add(null);
      }

      _isLeftSliderMoving = false;

      _leftSliderMovingChangeController.sink.add(false);
    }
  }

  SliderCoordinate _createEndLeftSliderCoordinate() {
    return SliderCoordinate(
        left: _sliderEndBorder,
        right: _leftSliderCubit.coordinate.right,
        top: _leftSliderCubit.coordinate.top,
        bottom: _leftSliderCubit.coordinate.bottom);
  }

  void _handleRightSliderHorizontalDragUpdate(Offset delta) {
    if (_isRightSliderLocked && !_isAnimationActive) {
      if (delta.dx < 0 &&
          _rightSliderCubit.coordinate.right < _sliderEndBorder) {
        var coordinate = _createNewRightSliderCoordinate(delta);

        var opacity = _calculateNewRightSliderOpacity(coordinate);

        _rightSliderCubit.setCoordinate(coordinate);
        _rightSliderCubit.setOpacity(opacity);

        _leftSliderCubit.setOpacity(opacity);

        _rightSliderCubit.update();
        _leftSliderCubit.update();
      }

      if (!_isRightSliderMoving) {
        _isRightSliderMoving = true;

        _rightSliderMovingChangeController.sink.add(true);
      }
    }
  }

  SliderCoordinate _createNewRightSliderCoordinate(Offset delta) {
    var right = _rightSliderCubit.coordinate.right - delta.dx;

    if (right > _sliderEndBorder) {
      right = _sliderEndBorder;
    }

    return SliderCoordinate(
        left: _rightSliderCubit.coordinate.left,
        right: right,
        top: _rightSliderCubit.coordinate.top,
        bottom: _rightSliderCubit.coordinate.bottom);
  }

  double _calculateNewRightSliderOpacity(SliderCoordinate coordinate) {
    const rightCalculatePart = _rightSliderInitialRightCoordinate +
        SliderProperties.sliderWidth * 2 -
        40;

    var opactity =
        (_size.width - coordinate.right - rightCalculatePart) / _size.width;

    return opactity > 0 ? opactity : 0;
  }

  void _handleRightSliderHorizontalDragEnd(double _) async {
    if (_isRightSliderLocked && !_isAnimationActive) {
      if (!_isRightSliderMoving) {
        _rightSliderMovingChangeController.sink.add(true);
      }

      if (_rightSliderCubit.coordinate.right < _sliderEndBorder) {
        _isAnimationActive = true;

        var coordinate = _createEndRightSliderCoordinate();

        _rightSliderCubit.setCoordinate(coordinate);
        _rightSliderCubit.setAnimationDuration();
        _rightSliderCubit.setOpacity(0);

        _leftSliderCubit.setAnimationDuration();
        _leftSliderCubit.setOpacity(0);

        _rightSliderCubit.update();
        _leftSliderCubit.update();

        await Future.wait([
          _rightSliderCubit.onOpacityAnimationEnd.first,
          _rightSliderCubit.onPositionedAnimaionEnd.first,
          _leftSliderCubit.onOpacityAnimationEnd.first
        ]);

        _leftSliderCubit.setMoveDuration();
        _rightSliderCubit.setMoveDuration();

        _leftSliderCubit.update();
        _rightSliderCubit.update();

        _rightSliderAnimationEndController.sink.add(null);

        _isAnimationActive = false;
      } else {
        _rightSliderAnimationEndController.sink.add(null);
      }

      _isRightSliderMoving = false;

      _rightSliderMovingChangeController.sink.add(false);
    }
  }

  SliderCoordinate _createEndRightSliderCoordinate() {
    return SliderCoordinate(
        left: _rightSliderCubit.coordinate.left,
        right: _sliderEndBorder,
        top: _rightSliderCubit.coordinate.top,
        bottom: _rightSliderCubit.coordinate.bottom);
  }

  void enableLeftSlider() {
    _isLeftSliderEnabled = true;

    _show();
  }

  void disableLeftSlider() {
    _isLeftSliderEnabled = false;

    _show();
  }

  void enableRightSlider() {
    _isRightSliderEnabled = true;

    _show();
  }

  void disableRightSlider() {
    _isRightSliderEnabled = false;

    _show();
  }

  void disableSliders() {
    _isLeftSliderEnabled = false;
    _isRightSliderEnabled = false;

    _show();
  }

  void enableSliders() {
    _isLeftSliderEnabled = true;
    _isRightSliderEnabled = true;

    _show();
  }

  void showLockLeftSlider() {
    _leftSliderCubit.lock();
  }

  void showUnlockLeftSlider() {
    _leftSliderCubit.unlock();
  }

  void showLockRightSlider() {
    _rightSliderCubit.lock();
  }

  void showUnlockRightSlider() {
    _rightSliderCubit.unlock();
  }

  void showLockSliders() {
    _leftSliderCubit.lock();
    _rightSliderCubit.lock();
  }

  void showUnlockSliders() {
    _leftSliderCubit.unlock();
    _rightSliderCubit.unlock();
  }

  void setLockRightSlider(bool value) {
    _isRightSliderLocked = value;
  }

  void setLockLeftSlider(bool value) {
    _isLeftSliderLocked = value;
  }

  void setLockSliders(bool value) {
    setLockRightSlider(value);

    setLockLeftSlider(value);
  }

  void setLeftSliderAnimatedLayerType(AnimatedLayerType layerType) {
    _leftSliderCubit.setAnimatedLayerType(layerType);
  }

  void setRightSliderAnimatedLayerType(AnimatedLayerType layerType) {
    _rightSliderCubit.setAnimatedLayerType(layerType);
  }

  void setLayerOffset(Offset offset) {
    _leftSliderCubit.setLayerOffset(offset);
    _rightSliderCubit.setLayerOffset(offset);
  }

  void setLayerSize(Size size) {
    _leftSliderCubit.setLayerSize(size);
    _rightSliderCubit.setLayerSize(size);
  }

  Future<void> setDefaultCoordinate() async {
    _isAnimationActive = true;

    var leftCoordinate = _getLeftSliderInitialCoordinate();

    var rightCoordinat = _getRightSliderInitialCoordinate();

    _leftSliderCubit.setCoordinate(leftCoordinate);
    _rightSliderCubit.setCoordinate(rightCoordinat);

    _leftSliderCubit.update();
    _rightSliderCubit.update();

    await Future.wait([
      _leftSliderCubit.onPositionedAnimaionEnd.first,
      _rightSliderCubit.onPositionedAnimaionEnd.first
    ]);

    _isAnimationActive = false;
  }

  Future<void> setDefaultOpacity() async {
    _isAnimationActive = true;

    _leftSliderCubit.setAnimationDuration();
    _rightSliderCubit.setAnimationDuration();

    _leftSliderCubit.setOpacity(1);
    _rightSliderCubit.setOpacity(1);

    _leftSliderCubit.update();
    _rightSliderCubit.update();

    await Future.wait([
      _leftSliderCubit.onOpacityAnimationEnd.first,
      _rightSliderCubit.onOpacityAnimationEnd.first
    ]);

    _leftSliderCubit.setMoveDuration();
    _rightSliderCubit.setMoveDuration();

    _leftSliderCubit.update();
    _rightSliderCubit.update();

    _isAnimationActive = false;
  }

  void updateSliders() {
    _leftSliderCubit.update();
    _rightSliderCubit.update();
  }

  void _show() {
    emit(SlidersShow(_leftSliderCubit, _rightSliderCubit, _isLeftSliderEnabled,
        _isRightSliderEnabled));
  }

  @override
  Future<void> close() async {
    await _leftSliderAnimationEndController.close();
    await _rightSliderAnimationEndController.close();

    return super.close();
  }
}
