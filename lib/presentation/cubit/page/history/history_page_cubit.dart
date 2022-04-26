import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/page/history/result/check/check_result_info.dart';
import '../../../model/page/history/rephrase_result_info.dart';
import '../../../model/page/history/result/check/check_result_link.dart';
import '../../../model/page/history/result_info.dart';
import 'body/item/history_page_body_result_item_cubit.dart';

part 'history_page_state.dart';

class HistoryPageCubit extends Cubit<HistoryPageState> {
  final List<ResultInfo> _results = [];

  final List<HistoryPageBodyResultItemCubit> _itemsCubits = [];

  HistoryPageCubit() : super(HistoryPageInitial()) {
    _initialize();
  }

  void _initialize() {
    var text =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Facilisis volutpat est velit egestas. Ut consequat semper viverra nam libero. Morbi tristique senectus et netus. Tristique senectus et netus et malesuada fames ac. Massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada. Urna nec tincidunt praesent semper. Sit amet mauris commodo quis imperdiet massa tincidunt nunc. Tristique senectus et netus et. Diam phasellus vestibulum lorem sed risus ultricies tristique nulla aliquet. Purus semper eget duis at. Gravida arcu ac tortor dignissim convallis aenean et tortor. Pulvinar mattis nunc sed blandit libero volutpat sed. Et malesuada fames ac turpis. Aliquet enim tortor at auctor.';

    var links = List.generate(
        15,
        (index) => CheckResultLink(
            'https://stackoverflow.com/questions/49638499/how-to-make-scrollable-text-in-flutter',
            Random().nextInt(101)))
      ..sort((a, b) => b.percentages.compareTo(a.percentages));

    _results.addAll([
      CheckResultInfo(text, TextSource.docx, 100, links),
      RephraseResultInfo(text, TextSource.pdf, text),
      CheckResultInfo(text, TextSource.userInput, 50, links),
      RephraseResultInfo(text, TextSource.userInput, text),
      CheckResultInfo(text, TextSource.docx, 25, links),
    ]);

    for (var info in _results) {
      _itemsCubits.add(HistoryPageBodyResultItemCubit(info));
    }

    emit(HistoryPageShow(_itemsCubits));
  }
}
