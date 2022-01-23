import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'text_input_layer_state.dart';

class TextInputLayerCubit extends Cubit<TextInputLayerState> {
  TextInputLayerCubit() : super(TextInputLayerEmpty());
}
