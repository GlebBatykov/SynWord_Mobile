part of 'layer_header_cubit.dart';

@immutable
abstract class LayerHeaderState {
  final String title;

  const LayerHeaderState(this.title);
}

class LayerHeaderInitial extends LayerHeaderState {
  const LayerHeaderInitial(String title) : super(title);
}

class LayerHeaderForeground extends LayerHeaderState {
  final List<Widget> actions;

  final bool isActionsVisible;

  final void Function()? onClose;

  const LayerHeaderForeground(
      String title, this.actions, this.isActionsVisible, this.onClose)
      : super(title);
}

class LayerHeaderBackground extends LayerHeaderState {
  final Color color;

  const LayerHeaderBackground(String title, this.color) : super(title);
}
