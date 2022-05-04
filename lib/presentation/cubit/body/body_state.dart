part of 'body_cubit.dart';

@immutable
abstract class BodyState {}

class BodyInitial extends BodyState {}

class BodyShow extends BodyState {
  final LayersCanvasCubit canvasCubit;

  final SlidersCubit slidersCubit;

  BodyShow(this.canvasCubit, this.slidersCubit);
}
