import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../model/page/history/check_result_info.dart';

part 'check_result_page_state.dart';

class CheckResultPageCubit extends Cubit<CheckResultPageState> {
  CheckResultPageCubit(CheckResultInfo info) : super(CheckResultPageInitial()) {
    _initialize(info);
  }

  void _initialize(CheckResultInfo info) {
    emit(CheckResultPageShow(info.percentages));
  }
}
