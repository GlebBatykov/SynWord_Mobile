import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mapper_box/mapper_box.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/model/history/check/check_history.dart';
import '../../../../../domain/model/history/rephrase/rephrase_history.dart';
import '../../../../../domain/repository/remote/history_remote_repository.dart';
import '../../../../model/page/history/result/check/check_result_info.dart';
import '../../../../model/page/history/result/rephrase/rephrase_result_info.dart';
import '../../../../model/page/history/result_info.dart';
import 'item/history_page_body_result_item_cubit.dart';

part 'history_page_state.dart';

class HistoryPageBodyCubit extends Cubit<HistoryPageBodyState> {
  final List<HistoryPageBodyResultItemCubit> _itemsCubits = [];

  HistoryPageBodyCubit() : super(HistoryPageInitial()) {
    _initialize();
  }

  void _initialize() async {
    emit(HistoryPageLoad());

    var historyRemoteRepository = GetIt.instance<HistoryRemoteRepository>();

    var history = await historyRemoteRepository.getHistory();

    var resultInfos = <ResultInfo>[];

    for (var resultHistory in history.resultsHistories) {
      if (resultHistory is RephraseHistory) {
        resultInfos.add(MapperBox.instanse
            .map<RephraseHistory, RephraseResultInfo>(resultHistory));
      } else if (resultHistory is CheckHistory) {
        resultInfos.add(MapperBox.instanse
            .map<CheckHistory, CheckResultInfo>(resultHistory));
      }
    }

    for (var resultInfo in resultInfos) {
      _itemsCubits.add(HistoryPageBodyResultItemCubit(resultInfo));
    }

    emit(HistoryPageShow(_itemsCubits));
  }
}
