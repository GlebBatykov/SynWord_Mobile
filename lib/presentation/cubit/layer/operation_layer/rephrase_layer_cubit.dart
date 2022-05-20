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
  void work() {
    var text =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Facilisis volutpat est velit egestas. Ut consequat semper viverra nam libero. Morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac. Massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada. Urna nec tincidunt praesent semper. Sit amet mauris commodo quis imperdiet massa tincidunt nunc. Tristique senectus et netus et. Diam phasellus vestibulum lorem sed risus ultricies tristique nulla aliquet. Purus semper eget duis at. Gravida arcu ac tortor dignissim convallis aenean et tortor. Pulvinar mattis nunc sed blandit libero volutpat sed. Et malesuada fames ac turpis. Aliquet enim tortor at auctor.';

    _rephrasedTextCubit = RephrasedTextCubit(text, [
      RephrasedWord('ipsum', 6, 10, ['apple', 'word', 'man', 'second', 'first'])
    ]);

    showResult(RephraseLayerBodyContentData(_rephrasedTextCubit));
  }

  Future<void> copy() async {
    await GetIt.instance<ClipboardCopyUserCase>()
        .copy(_rephrasedTextCubit.text);
  }
}
