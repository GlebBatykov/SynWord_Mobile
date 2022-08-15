import '../../model/contraints_list/contraints_list.dart';

abstract class ContraintsListRemoteRepository {
  Future<ContraintsList> getContraintsList();
}
