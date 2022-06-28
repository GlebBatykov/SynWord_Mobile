import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/repository/remote/history_remote_repository.dart';
import '../../../../model/page/history/result_info.dart';
import 'item/history_page_body_result_item_cubit.dart';

part 'history_page_state.dart';

class HistoryPageBodyCubit extends Cubit<HistoryPageBodyState> {
  final List<ResultInfo> _results = [];

  final List<HistoryPageBodyResultItemCubit> _itemsCubits = [];

  HistoryPageBodyCubit() : super(HistoryPageInitial()) {
    _initialize();
  }

  void _initialize() async {
    emit(HistoryPageLoad());

    var historyRemoteRepository = GetIt.instance<HistoryRemoteRepository>();

    var history = await historyRemoteRepository.getHistory();

    // TODO соритровать по датам результаты

    emit(HistoryPageShow(_itemsCubits));
  }
}
