part of 'operation_layer.dart';

class CheckLayerCubit extends OperationLayerCubit<CheckLayerBodyContentData,
    LayerBodyPreparationData> {
  CheckResult? _result;

  CheckResult? get result => _result;

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
  void work() async {
    var text = GetIt.instance<BodyCubit>().text;

    _result = await GetIt.instance<CheckRemoteRepository>().checkText(text);

    showResult(
        CheckLayerBodyContentData(_size, _result!.percentages, _result!.links));

    await super.work();
  }
}
