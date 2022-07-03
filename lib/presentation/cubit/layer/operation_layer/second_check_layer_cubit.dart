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
  void work() async {
    var bodyCubit = GetIt.instance<BodyCubit>();

    var initialCheckResult = bodyCubit.initialTextCheckResult!;

    var rephrasedText = bodyCubit.rephrasedText!;

    var checkRemoteRepository = GetIt.instance<CheckRemoteRepository>();

    var checkResult = await checkRemoteRepository.checkText(rephrasedText);

    showResult(SecondCheckLayerBodyContentData(
        _size,
        initialCheckResult.percentages,
        checkResult.percentages,
        checkResult.links));

    await super.work();
  }
}
