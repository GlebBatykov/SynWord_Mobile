import 'package:clipboard/clipboard.dart';

import 'clipboard_copy_use_case.dart';

class FlutterClipboardCopyUseCase extends ClipboardCopyUserCase {
  @override
  Future<void> copy(String text) async {
    await FlutterClipboard.copy(text);
  }
}
