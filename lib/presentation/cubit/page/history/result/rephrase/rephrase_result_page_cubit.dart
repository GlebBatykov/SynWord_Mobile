import 'package:bloc/bloc.dart';
import 'package:clipboard/clipboard.dart';
import 'package:meta/meta.dart';

import '../../../../../model/page/history/result/rephrase/rephrase_result_info.dart';
import '../../../../rephrased_text/rephrased_text_cubit.dart';

part 'rephrase_result_page_state.dart';

class RephraseResultPageCubit extends Cubit<RephraseResultPageState> {
  final RephraseResultInfo _info;

  late final RephrasedTextCubit _rephrasedTextCubit;

  int _selectedTabIndex = 0;

  RephraseResultPageCubit(RephraseResultInfo info)
      : _info = info,
        super(RephraseResultPageInitial()) {
    _initialize();
  }

  void _initialize() {
    _rephrasedTextCubit =
        RephrasedTextCubit(_info.rephrasedText, _info.rephrasedWords);

    emit(RephraseResultPageShow(_info.text, _rephrasedTextCubit));
  }

  Future<void> copy() async {
    late String text;

    if (_selectedTabIndex == 0) {
      text = _info.text;
    } else {
      text = _rephrasedTextCubit.text;
    }

    await FlutterClipboard.copy(text);
  }

  void changeSelectedTab(int index) {
    _selectedTabIndex = index;
  }
}
