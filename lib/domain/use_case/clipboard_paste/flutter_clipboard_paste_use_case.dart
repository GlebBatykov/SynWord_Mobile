import 'package:clipboard/clipboard.dart';

import 'clipboard_paste_use_case.dart';

class FlutterClipboardPasteUseCase extends ClipboardPasteUseCase {
  @override
  Future<String> paste() async {
    return await FlutterClipboard.paste();
  }
}
