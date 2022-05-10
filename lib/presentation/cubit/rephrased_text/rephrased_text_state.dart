part of 'rephrased_text_cubit.dart';

@immutable
abstract class RephrasedTextState {}

class RephrasedTextInitial extends RephrasedTextState {}

class RephrasedTextShow extends RephrasedTextState {
  final List<InlineSpan> spans;

  RephrasedTextShow(this.spans);
}
