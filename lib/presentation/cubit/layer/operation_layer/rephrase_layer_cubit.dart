part of 'operation_layer.dart';

class RephraseLayerCubit
    extends OperationLayerCubit<RephraseLayerBodyContentData> {
  RephraseLayerCubit(Offset offset, Size size) : super(offset, size);

  @override
  void _initialize() {
    _headerCubit = OperationLayerHeaderCubit(
        'Plagiarism Checker', HexColor('DDC5A2'),
        actions: [
          RephraseLayerCubitCopyButton(
            onTap: _onTap,
          )
        ]);

    _bodyCubit = OperationLayerBodyCubit<RephraseLayerBodyContentData>(
        builder: _buildContent);

    load();

    _show();
  }

  void _onTap() async {
    await copy();
  }

  Widget _buildContent(RephraseLayerBodyContentData data) =>
      RephraseLayerBody(data: data);

  @override
  void work() {
    show(RephraseLayerBodyContentData());
  }

  Future<void> copy() async {
    //await FlutterClipboard.copy('1');
  }
}
