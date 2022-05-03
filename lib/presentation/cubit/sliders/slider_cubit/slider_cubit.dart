import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderLock());

  void lock() {
    emit(SliderLock());
  }

  void unlock() {
    emit(SliderUnlock());
  }
}
