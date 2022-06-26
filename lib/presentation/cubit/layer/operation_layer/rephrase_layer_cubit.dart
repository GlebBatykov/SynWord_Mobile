part of 'operation_layer.dart';

class RephraseLayerCubit extends OperationLayerCubit<
    RephraseLayerBodyContentData, RephraseLayerBodyPreparationData> {
  late RephrasedTextCubit _rephrasedTextCubit;

  RephraseLayerCubit(super.offset, super.size, {super.onClose});

  @override
  void _initialize() {
    _headerCubit = OperationLayerHeaderCubit('Rephrase', HexColor('DDC5A2'),
        actions: [
          RephraseLayerCubitCopyButton(
            onTap: _onTap,
          )
        ],
        onClose: _onClose);

    _bodyCubit = OperationLayerBodyCubit<RephraseLayerBodyContentData,
            RephraseLayerBodyPreparationData>(
        resultBuilder: _buildResult,
        preparationPageBuilder: _buildPreparationPage);

    load();

    _show();
  }

  void _onTap() async {
    await copy();
  }

  Widget _buildResult(RephraseLayerBodyContentData data) =>
      RephraseLayerBody(data: data);

  Widget _buildPreparationPage(RephraseLayerBodyPreparationData data) =>
      RephraseLayerPreparation(data: data);

  @override
  void work() async {
    var bodyCubit = GetIt.instance<BodyCubit>();

    var text = bodyCubit.text;

    var rephraseLanguage = bodyCubit.rephraseLanguage;

    var result = await GetIt.instance<RephraseRemoteRepository>()
        .rephraseText(text, rephraseLanguage);

    _rephrasedTextCubit =
        RephrasedTextCubit(result.rephrasedText, result.rephrasedWords);

    showResult(RephraseLayerBodyContentData(_rephrasedTextCubit));
  }

  Future<void> copy() async {
    await GetIt.instance<ClipboardCopyUserCase>()
        .copy(_rephrasedTextCubit.text);
  }
}
