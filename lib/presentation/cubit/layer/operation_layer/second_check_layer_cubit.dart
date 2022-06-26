part of 'operation_layer.dart';

class SecondCheckLayerCubit extends OperationLayerCubit<
    SecondCheckLayerBodyContentData, LayerBodyPreparationData> {
  SecondCheckLayerCubit(Offset offset, Size size, {super.onClose})
      : super(offset, size);

  @override
  void _initialize() {
    _headerCubit = OperationLayerHeaderCubit(
        'Plagiarism Checker', HexColor('DDC5A2'),
        onClose: _onClose);

    _bodyCubit = OperationLayerBodyCubit<SecondCheckLayerBodyContentData,
        LayerBodyPreparationData>(resultBuilder: _buildResult);

    load();

    _show();
  }

  Widget _buildResult(SecondCheckLayerBodyContentData data) =>
      SecondCheckLayerBody(data: data);

  @override
  void work() {
    var links = List.generate(
        15,
        (index) => CheckResultLink(
            'https://stackoverflow.com/questions/49638499/how-to-make-scrollable-text-in-flutter',
            Random().nextInt(101).toDouble()))
      ..sort((a, b) => b.percentages.compareTo(a.percentages));

    showResult(SecondCheckLayerBodyContentData(_size, 0.4, 0.6, links));
  }
}
