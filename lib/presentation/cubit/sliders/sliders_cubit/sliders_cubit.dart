import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:synword/presentation/ui/sliders/slider_properties.dart';

import '../../../model/sliders/slider_coordinate.dart';
import '../slider_cubit/slider_cubit.dart';

part 'sliders_state.dart';

class SlidersCubit extends Cubit<SlidersState> {
  static const double _leftSliderInitialLeftCoordinate = -36;

  static const double _rightSliderInitialRightCoordinate = -36;

  final Size _size;

  late final SliderCubit _leftSliderCubit;

  late final SliderCubit _rightSliderCubit;

  bool _isLeftSliderEnabled = true;

  bool _isRightSliderEnabled = true;

  bool _isLeftSliderLocked = true;

  bool _isRightSliderLocked = true;

  bool _isAnimationActive = false;

  SlidersCubit(Size size)
      : _size = size,
        super(const SlidersInitial()) {
    _initialize();
  }

  void _initialize() {
    _leftSliderCubit = SliderCubit(
        SliderCoordinate(left: _leftSliderInitialLeftCoordinate, bottom: 50));

    _rightSliderCubit = SliderCubit(SliderCoordinate(
        right: _rightSliderInitialRightCoordinate, bottom: 50));

    _leftSliderCubit.horizontalDragUpdate.listen((event) {
      _handleLeftSliderHorizontalDragUpdate(event);
    });

    _leftSliderCubit.horizontalDragEnd.listen((event) {
      _handleLeftSliderHorizontalDragEnd();
    });

    _rightSliderCubit.horizontalDragUpdate.listen((event) {
      _handleRightSliderHorizontalDragUpdate(event);
    });

    _rightSliderCubit.horizontalDragEnd.listen((event) {
      _handleRightSliderHorizontalDragEnd();
    });

    _show();
  }

  void _handleLeftSliderHorizontalDragUpdate(Offset delta) {
    if (_isLeftSliderLocked && !_isAnimationActive) {
      if (delta.dx > 0) {
        var coordinate = _createNewLeftSliderCoordinate(delta);

        var opacity = _calculateNewLeftSliderOpacity(coordinate);

        _leftSliderCubit.setCoordinate(coordinate);

        _leftSliderCubit.setOpacity(opacity);

        _leftSliderCubit.update();
      }
    }
  }

  SliderCoordinate _createNewLeftSliderCoordinate(Offset delta) {
    return SliderCoordinate(
        left: _leftSliderCubit.coordinate.left + delta.dx,
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

  void _handleLeftSliderHorizontalDragEnd() {
    if (_isLeftSliderLocked && !_isAnimationActive) {
      _isAnimationActive = true;

      var coordinate = _createEndLeftSliderCoordinate();

      _leftSliderCubit.setCoordinate(coordinate);

      _leftSliderCubit.setAnimationDuration();

      _leftSliderCubit.setOpacity(0);

      _leftSliderCubit.update();

      _isAnimationActive = false;
    }
  }

  SliderCoordinate _createEndLeftSliderCoordinate() {
    return SliderCoordinate(
        left: _size.width - SliderProperties.sliderWidth,
        right: _leftSliderCubit.coordinate.right,
        top: _leftSliderCubit.coordinate.top,
        bottom: _leftSliderCubit.coordinate.bottom);
  }

  void _handleRightSliderHorizontalDragUpdate(Offset delta) {
    if (_isRightSliderLocked && !_isAnimationActive) {
      if (delta.dx < 0) {
        var coordinate = _createNewRightSliderCoordinate(delta);

        //var opacity = _calculateNewRightSliderOpacity(coordinate);

        _rightSliderCubit.setCoordinate(coordinate);

        //_rightSliderCubit.setOpacity(opacity);

        _rightSliderCubit.update();
      }
    }
  }

  SliderCoordinate _createNewRightSliderCoordinate(Offset delta) {
    print(_leftSliderCubit.coordinate.right - delta.dx);

    return SliderCoordinate(
        left: _leftSliderCubit.coordinate.left,
        right: _leftSliderCubit.coordinate.right - delta.dx,
        top: _leftSliderCubit.coordinate.top,
        bottom: _leftSliderCubit.coordinate.bottom);
  }

  double _calculateNewRightSliderOpacity(SliderCoordinate coordinate) {
    const rightCalculatePart = _rightSliderInitialRightCoordinate +
        SliderProperties.sliderWidth * 2 -
        40;

    var opactity =
        (_size.width - coordinate.right - rightCalculatePart) / _size.width;

    return opactity > 0 ? opactity : 0;
  }

  void _handleRightSliderHorizontalDragEnd() {
    if (!_isRightSliderLocked && !_isAnimationActive) {}
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

  void _show() {
    emit(SlidersShow(_leftSliderCubit, _rightSliderCubit, _isLeftSliderEnabled,
        _isRightSliderEnabled));
  }
}
