import '../../model/history/history.dart';

abstract class HistoryRemoteRepository {
  Future<History> getHistory();
}
