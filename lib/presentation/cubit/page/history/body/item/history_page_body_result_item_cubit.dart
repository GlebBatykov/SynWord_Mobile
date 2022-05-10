import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poseidon/poseidon.dart';
import 'package:synword/presentation/model/page/history/result/check/check_result_info.dart';
import 'package:synword/presentation/model/page/history/result/rephrase/rephrase_result_info.dart';
import 'package:synword/presentation/navigation/check_result_page_arguments.dart';
import 'package:synword/presentation/navigation/navigation_routes.dart';
import 'package:synword/presentation/navigation/rephrase_result_page_arguments.dart';

import '../../../../../model/page/history/result_info.dart';

part 'history_page_body_result_item_state.dart';

class HistoryPageBodyResultItemCubit
    extends Cubit<HistoryPageBodyResultItemState> {
  HistoryPageBodyResultItemCubit(ResultInfo info)
      : super(HistoryPageBodyResultItemInitial()) {
    _initialize(info);
  }

  void _initialize(ResultInfo info) {
    if (info is CheckResultInfo) {
      emit(HistoryPageBodyResultItemCheck('Plagiarism check', info.text, () {
        Poseidon.instance.navigate(NavigationRoutes.checkResultPage,
            arguments: CheckResultPageArguments(info));
      }, info.percentages));
    } else if (info is RephraseResultInfo) {
      emit(HistoryPageBodyResultItemRephrase('Rephrased', info.text, () {
        Poseidon.instance.navigate(NavigationRoutes.rephraseResultPage,
            arguments: RephraseResultPageArguments(info));
      }));
    }
  }
}
