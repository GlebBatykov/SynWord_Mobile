import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../model/page/history/rephrase_result_info.dart';

part 'rephrase_result_page_state.dart';

class RephraseResultPageCubit extends Cubit<RephraseResultPageState> {
  RephraseResultPageCubit(RephraseResultInfo info)
      : super(RephraseResultPageInitial());
}
