import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sliders_state.dart';

class SlidersCubit extends Cubit<SlidersState> {
  SlidersCubit() : super(const SlidersState(true, true));
}
