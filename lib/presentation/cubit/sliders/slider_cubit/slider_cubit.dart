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

  double _opacity = 1;

  SliderCoordinate _coordinate;

  bool _isLocked = true;

  late Duration _duration;

  SliderCoordinate get coordinate => _coordinate;

  Stream<Offset> get horizontalDragUpdate =>
      _onHorizontalDragUpdateController.stream;

  Stream<double> get horizontalDragEnd => _onHorizontalDragEndController.stream;

  SliderCubit(SliderCoordinate coordinate)
      : _coordinate = coordinate,
        super(SliderInitial()) {
    _initialize();
  }

  void _initialize() {
    setMoveDuration();

    unlock();
  }

  void lock() {
    if (!_isLocked) {
      emit(SliderLock(_opacity, _coordinate, _duration, _onHorizontalDragUpdate,
          _onHorizontalDragEnd));

      _isLocked = true;
    }
  }

  void unlock() {
    if (_isLocked) {
      emit(SliderUnlock(_opacity, _coordinate, _duration,
          _onHorizontalDragUpdate, _onHorizontalDragEnd));

      _isLocked = false;
    }
  }

  void _onHorizontalDragUpdate(Offset delta) {
    _onHorizontalDragUpdateController.sink.add(delta);
  }

  void _onHorizontalDragEnd(double primaryVelocity) {
    _onHorizontalDragEndController.sink.add(primaryVelocity);
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
      emit(SliderLock(_opacity, _coordinate, _duration, _onHorizontalDragUpdate,
          _onHorizontalDragEnd));
    } else {
      emit(SliderUnlock(_opacity, _coordinate, _duration,
          _onHorizontalDragUpdate, _onHorizontalDragEnd));
    }
  }

  @override
  Future<void> close() async {
    await _onHorizontalDragUpdateController.close();
    await _onHorizontalDragEndController.close();

    return super.close();
  }
}
