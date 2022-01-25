import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/layer/text_input_layer_cubit/text_input_layer_body_cubit/text_input_layer_body_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/layer/text_input_layer_cubit/text_input_layer_header_cubit/text_input_layer_header_cubit.dart';

part 'text_input_layer_state.dart';

class TextInputLayerCubit extends Cubit<TextInputLayerState> {
  final Size _size;

  late final TextInputLayerHeaderCubit _headerCubit;

  late final TextInputLayerBodyCubit _bodyCubit;

  TextInputLayerCubit(Size size)
      : _size = size,
        super(TextInputLyaerInitial(size));
}
