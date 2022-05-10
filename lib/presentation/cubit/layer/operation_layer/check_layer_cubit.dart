part of 'operation_layer.dart';

class CheckLayerCubit extends OperationLayerCubit<CheckLayerBodyContentData> {
  CheckLayerCubit(Offset offset, Size size) : super(offset, size);

  @override
  void _initialize() {
    _headerCubit =
        OperationLayerHeaderCubit('Plagiarism Checker', HexColor('DDC5A2'));

    _bodyCubit = OperationLayerBodyCubit<CheckLayerBodyContentData>(
        builder: _buildContent);

    load();

    _show();
  }

  Widget _buildContent(CheckLayerBodyContentData data) =>
      CheckLayerBody(data: data);

  @override
  void work() {
    var links = List.generate(
        15,
        (index) => CheckResultLink(
            'https://stackoverflow.com/questions/49638499/how-to-make-scrollable-text-in-flutter',
            Random().nextInt(101)))
      ..sort((a, b) => b.percentages.compareTo(a.percentages));

    show(CheckLayerBodyContentData(0.6, links));
  }
}
