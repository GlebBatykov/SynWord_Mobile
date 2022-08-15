import 'package:poseidon/poseidon.dart';

import '../../presentation/ui/message_snackbar.dart';

class ShowMessageUseCase {
  void show(String text) {
    Poseidon.instance.showSnackBar(MessageSnackBar(message: 'Url copied'));
  }
}
