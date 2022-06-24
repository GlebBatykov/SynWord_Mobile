import '../../model/history.dart';

abstract class HistoryRemoteRepository {
  Future<History> getHistory();
}
