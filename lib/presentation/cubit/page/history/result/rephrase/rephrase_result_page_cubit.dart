import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:synword_flutter_cubit_application/presentation/model/page/history/result/rephrase/rephrased_word.dart';
import 'package:synword_flutter_cubit_application/presentation/model/page/history/result_info.dart';

import '../../../../../model/page/history/result/rephrase/rephrase_result_info.dart';

part 'rephrase_result_page_state.dart';

class RephraseResultPageCubit extends Cubit<RephraseResultPageState> {
  RephraseResultPageCubit(RephraseResultInfo info)
      : super(RephraseResultPageInitial()) {
    _initialize(info);
  }

  void _initialize(RephraseResultInfo info) {
    emit(RephraseResultPageShow(
        info.text, info.rephrasedText, info.source, info.rephrasedWord));
  }
}
