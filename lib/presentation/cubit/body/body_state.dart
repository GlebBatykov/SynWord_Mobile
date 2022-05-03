part of 'body_cubit.dart';

@immutable
abstract class BodyState {}

class BodyInitial extends BodyState {}

class BodyShow extends BodyState {
  final TextInputLayerCubit inputLayerCubit;

  final SlidersCubit slidersCubit;

  BodyShow(this.inputLayerCubit, this.slidersCubit);
}
