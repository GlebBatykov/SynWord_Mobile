import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/page/history/body/item/history_page_body_result_item_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/model/page/history/check_result_info.dart';
import 'package:synword_flutter_cubit_application/presentation/model/page/history/rephrase_result_info.dart';

import '../../../model/page/history/result_info.dart';

part 'history_page_state.dart';

class HistoryPageCubit extends Cubit<HistoryPageState> {
  final List<ResultInfo> _results = [];

  final List<HistoryPageBodyResultItemCubit> _itemsCubits = [];

  HistoryPageCubit() : super(HistoryPageInitial()) {
    _initialize();
  }

  void _initialize() {
    _results.addAll([
      CheckResultInfo(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
          TextSource.docx,
          100),
      RephraseResultInfo(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
          TextSource.pdf,
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam'),
      CheckResultInfo(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
          TextSource.userInput,
          50),
      RephraseResultInfo(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
          TextSource.userInput,
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam'),
      CheckResultInfo(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
          TextSource.docx,
          25),
    ]);

    for (var info in _results) {
      _itemsCubits.add(HistoryPageBodyResultItemCubit(info));
    }

    emit(HistoryPageShow(_itemsCubits));
  }
}
