import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../model/layer/text_input_layer/editing_change_details.dart';
import '../../model/layer/text_input_layer/length_borders.dart';
import '../../model/layer/text_input_layer/text_change_details.dart';
import '../../ui/layer/layer_properties.dart';
import '../layer/layers_canvas/layers_canvas_cubit.dart';
import '../layer/text_input_layer/text_input_layer_cubit.dart';
import '../sliders/slider_cubit/slider_cubit.dart';
import '../sliders/sliders_cubit/sliders_cubit.dart';

part 'body_state.dart';

class BodyCubit extends Cubit<BodyState> {
  final Size _size;

  late final LengthBorders _textLengthBorders;

  late final LayersCanvasCubit _canvasCubit;

  late final SlidersCubit _slidersCubit;

  OperationLayerType _leftSliderCalledLayer = OperationLayerType.check;

  OperationLayerType _rightSliderCalledLayer = OperationLayerType.rephrase;

  BodyCubit(Size size)
      : _size = size,
        super(BodyInitial()) {
    _initialize();
  }

  void _initialize() {
    _textLengthBorders = LengthBorders(100, 10000);

    var inputLayerCubit = TextInputLayerCubit(_textLengthBorders, _size);

    _canvasCubit = LayersCanvasCubit(_size, inputLayerCubit);

    _canvasCubit.textChanges.listen(_handleTextChange);

    _canvasCubit.editingChanges.listen(_handleEditingChanges);

    _canvasCubit.removeLayer.listen((_) {
      _handleRemoveLayer();
    });

    _slidersCubit = SlidersCubit(_size);

    _slidersCubit.leftSliderAnimationEnd.listen((_) {
      _handleLeftSliderAnimationEnd();
    });

    _slidersCubit.leftSliderMovingChange.listen((value) async {
      if (value) {
        await _canvasCubit.animateLayersToTop();
      }
    });

    _slidersCubit.rightSliderAnimationEnd.listen((_) {
      _handleRightSliderAnimationEnd();
    });

    _slidersCubit.rightSliderMovingChange.listen((value) async {
      if (value) {
        await _canvasCubit.animateLayersToTop();
      }
    });

    emit(BodyShow(_canvasCubit, _slidersCubit));
  }

  void _handleTextChange(TextChangeDetails details) {
    _handleBodyChanges(details.length, details.isEditing);
  }

  void _handleEditingChanges(EditingChangeDetails details) {
    _handleBodyChanges(details.textLength, details.isEditing);
  }

  void _handleBodyChanges(int textLength, bool isEditing) {
    if (!isEditing) {
      if (textLength == 0) {
        _slidersCubit.setLockSliders(false);
        _slidersCubit.showUnlockSliders();
      } else {
        _checkLengthBorders(textLength);
      }
    } else {
      _checkLengthBorders(textLength);
    }
  }

  void _checkLengthBorders(int textLength) {
    if (textLength <= _textLengthBorders.min) {
      _slidersCubit.setLockSliders(true);
      _slidersCubit.showLockSliders();
    } else {
      _slidersCubit.setLockSliders(false);
      _slidersCubit.showUnlockSliders();
    }
  }

  void _handleRemoveLayer() {
    _updateSliders();
  }

  void _handleLeftSliderAnimationEnd() {
    _addCalledLayer(_leftSliderCalledLayer);

    _updateSliders();
  }

  void _handleRightSliderAnimationEnd() {
    _addCalledLayer(_rightSliderCalledLayer);

    _updateSliders();
  }

  void _addCalledLayer(OperationLayerType layer) {
    switch (layer) {
      case OperationLayerType.check:
        _canvasCubit.addCheckLayer();
        break;
      case OperationLayerType.secondCheck:
        _canvasCubit.addSecondCheckLayer();
        break;
      case OperationLayerType.rephrase:
        _canvasCubit.addRephraseLayer();
    }
  }

  void _updateSliders() async {
    var currentLayers = _canvasCubit.currentLayers;

    if (currentLayers.isEmpty) {
      _leftSliderCalledLayer = OperationLayerType.check;
      _rightSliderCalledLayer = OperationLayerType.rephrase;

      _slidersCubit.setLeftSliderAnimatedLayerType(AnimatedLayerType.check);
      _slidersCubit.setRightSliderAnimatedLayerType(AnimatedLayerType.rephrase);

      _slidersCubit.enableSliders();
    } else if (currentLayers.length == 1) {
      if (currentLayers.first == OperationLayerType.check) {
        _rightSliderCalledLayer = OperationLayerType.rephrase;

        _slidersCubit
            .setRightSliderAnimatedLayerType(AnimatedLayerType.rephrase);

        _slidersCubit.enableRightSlider();
        _slidersCubit.disableLeftSlider();
      } else {
        _leftSliderCalledLayer = OperationLayerType.check;

        _slidersCubit.setLeftSliderAnimatedLayerType(AnimatedLayerType.check);

        _slidersCubit.enableLeftSlider();
        _slidersCubit.disableRightSlider();
      }
    } else if (currentLayers.length == 2) {
      _leftSliderCalledLayer = OperationLayerType.secondCheck;

      _slidersCubit.setLeftSliderAnimatedLayerType(AnimatedLayerType.check);

      _slidersCubit.enableLeftSlider();
      _slidersCubit.disableRightSlider();
    } else {
      _slidersCubit.disableSliders();
    }

    var offset = _getLayerOffset();

    _slidersCubit.setLayerOffset(offset);

    var size = _getLayerSize();

    _slidersCubit.setLayerSize(size);

    _slidersCubit.updateSliders();

    await _slidersCubit.setDefaultCoordinate();

    await _slidersCubit.setDefaultOpacity();
  }

  Offset _getLayerOffset() {
    return Offset(
        0,
        (_canvasCubit.operationLayersLength + 1) *
            LayerProperties.headerContactHeight);
  }

  Size _getLayerSize() {
    return Size(
        _size.width,
        _size.height -
            ((_canvasCubit.operationLayersLength + 1) *
                LayerProperties.headerContactHeight));
  }
}
