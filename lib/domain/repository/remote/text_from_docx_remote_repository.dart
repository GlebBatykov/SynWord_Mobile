import 'dart:typed_data';

abstract class TextFromDocxRemoteRepository {
  Future<String> getTextFromDocx(Uint8List bytes);
}
