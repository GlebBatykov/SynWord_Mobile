import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../model/sliders/slider_coordinate.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  final StreamController<Offset> _onHorizontalDragUpdateController =
      StreamController.broadcast();

  final StreamController<double> _onHorizontalDragEndController =
      StreamController.broadcast();

  final StreamController _onOpacityAnimationEndController =
      StreamController.broadcast();

  final StreamController _onPositionedAnimationEndController =
      StreamController.broadcast();

  Size _layerSize;

  Offset _layerOffset;

  double _opacity = 1;

  SliderCoordinate _coordinate;

  bool _isLocked = true;

  late Duration _duration;

  SliderCoordinate get coordinate => _coordinate;

  Stream<Offset> get horizontalDragUpdate =>
      _onHorizontalDragUpdateController.stream;

  Stream<double> get horizontalDragEnd => _onHorizontalDragEndController.stream;

  Stream get onOpacityAnimationEnd => _onOpacityAnimationEndController.stream;

  Stream get onPositionedAnimaionEnd =>
      _onPositionedAnimationEndController.stream;

  SliderCubit(SliderCoordinate coordinate, Size layerSize, Offset layerOffset)
      : _coordinate = coordinate,
        _layerSize = layerSize,
        _layerOffset = layerOffset,
        super(SliderInitial()) {
    _initialize();
  }

  void _initialize() {
    setMoveDuration();

    unlock();
  }

  void lock() {
    if (!_isLocked) {
      _lock();

      _isLocked = true;
    }
  }

  void unlock() {
    if (_isLocked) {
      _unlock();

      _isLocked = false;
    }
  }

  void setOpacity(double value) {
    _opacity = value;
  }

  void setCoordinate(SliderCoordinate value) {
    _coordinate = value;
  }

  void setMoveDuration() {
    _duration = const Duration();
  }

  void setAnimationDuration() {
    _duration = const Duration(milliseconds: 300);
  }

  void update() {
    if (_isLocked) {
      _lock();
    } else {
      _unlock();
    }
  }

  void _lock() {
    emit(SliderLock(
        _layerSize,
        _layerOffset,
        _opacity,
        _coordinate,
        _duration,
        _onHorizontalDragUpdate,
        _onHorizontalDragEnd,
        _onOpactityAnimationEnd,
        _onPositionedAnimationEnd));
  }

  void _unlock() {
    emit(SliderUnlock(
        _layerSize,
        _layerOffset,
        _opacity,
        _coordinate,
        _duration,
        _onHorizontalDragUpdate,
        _onHorizontalDragEnd,
        _onOpactityAnimationEnd,
        _onPositionedAnimationEnd));
  }

  void _onHorizontalDragUpdate(Offset delta) {
    _onHorizontalDragUpdateController.sink.add(delta);
  }

  void _onHorizontalDragEnd(double primaryVelocity) {
    _onHorizontalDragEndController.sink.add(primaryVelocity);
  }

  void _onOpactityAnimationEnd() {
    _onOpacityAnimationEndController.sink.add(null);
  }

  void _onPositionedAnimationEnd() {
    _onPositionedAnimationEndController.sink.add(null);
  }

  @override
  Future<void> close() async {
    await _onHorizontalDragUpdateController.close();
    await _onHorizontalDragEndController.close();
    await _onOpacityAnimationEndController.close();
    await _onPositionedAnimationEndController.close();

    return super.close();
  }
}
