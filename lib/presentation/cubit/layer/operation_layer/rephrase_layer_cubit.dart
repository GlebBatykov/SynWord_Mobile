part of 'operation_layer.dart';

enum RephraseType { synonymizer, enhanced }

class RephraseLayerCubit extends OperationLayerCubit<
    RephraseLayerBodyContentData, RephraseLayerBodyPreparationData> {
  late final PriceList _priceList;

  late final int _coins;

  String? _rephrasedText;

  late RephrasedTextCubit _rephrasedTextCubit;

  RephraseType? _rephraseType;

  String? get rephrasedText => _rephrasedText;

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
  Future<void> initialize() async {
    _priceList =
        await GetIt.instance<PriceListRemoteRepository>().getPriceList();

    _coins = await GetIt.instance<CoinsRemoteRepository>().getCoins();

    var preparationData = RephraseLayerBodyPreparationData(
        _coins,
        _priceList.rephrasePrice.value,
        _priceList.enhancedRephrasePrice.value,
        this);

    showPreparationPage(preparationData);
  }

  @override
  void work() async {
    if (_rephraseType != null) {
      load();

      late RephraseLayerBodyContentData contentData;

      var bodyCubit = GetIt.instance<BodyCubit>();

      var text = bodyCubit.text;

      if (_rephraseType == RephraseType.synonymizer) {
        var rephraseLanguage = bodyCubit.rephraseLanguage;

        var result = await GetIt.instance<RephraseRemoteRepository>()
            .rephraseText(text, rephraseLanguage);

        _rephrasedText = result.rephrasedText;

        _rephrasedTextCubit =
            RephrasedTextCubit(result.rephrasedText, result.rephrasedWords);

        contentData = RephraseLayerBodyRephraseData(_rephrasedTextCubit);
      } else {
        var result = await GetIt.instance<RephraseRemoteRepository>()
            .enhancedRephraseText(text);

        _rephrasedText = result.rephrasedText;

        contentData =
            RephraseLayerBodyEnhancedRephraseData(result.rephrasedText);
      }

      showResult(contentData);

      await super.work();
    }
  }

  Future<void> copy() async {
    await GetIt.instance<ClipboardCopyUserCase>()
        .copy(_rephrasedTextCubit.text);
  }

  void setRephraseType(RephraseType type) {
    _rephraseType = type;
  }
}
