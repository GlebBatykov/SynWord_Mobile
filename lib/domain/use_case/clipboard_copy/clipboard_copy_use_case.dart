import '../show_message_use_case.dart';

abstract class ClipboardCopyUserCase {
  Future<void> copy(String text) async {
    ShowMessageUseCase().show('Url copied');
  }
}
