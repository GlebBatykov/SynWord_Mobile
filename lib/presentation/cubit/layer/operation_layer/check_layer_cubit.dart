part of 'operation_layer.dart';

class CheckLayerCubit extends OperationLayerCubit<CheckLayerBodyContentData,
    LayerBodyPreparationData> {
  CheckLayerCubit(Offset offset, Size size, {super.onClose})
      : super(offset, size);

  @override
  void _initialize() {
    _headerCubit = OperationLayerHeaderCubit(
        'Plagiarism Checker', HexColor('DDC5A2'),
        onClose: _onClose);

    _bodyCubit = OperationLayerBodyCubit<CheckLayerBodyContentData,
        LayerBodyPreparationData>(resultBuilder: _buildResult);

    load();

    _show();
  }

  Widget _buildResult(CheckLayerBodyContentData data) =>
      CheckLayerBody(data: data);

  @override
  void work() {
    var links = List.generate(
        15,
        (index) => CheckResultLink(
            'https://stackoverflow.com/questions/49638499/how-to-make-scrollable-text-in-flutter',
            Random().nextInt(101)))
      ..sort((a, b) => b.percentages.compareTo(a.percentages));

    showResult(CheckLayerBodyContentData(_size, 0.6, links));
  }
}
