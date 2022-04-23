import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../model/page/history/check_result_log.dart';

part 'check_result_page_state.dart';

class CheckResultPageCubit extends Cubit<CheckResultPageState> {
  CheckResultPageCubit(CheckResultInfo info) : super(CheckResultPageInitial());
}
