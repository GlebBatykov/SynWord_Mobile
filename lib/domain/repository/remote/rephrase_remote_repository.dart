import '../../model/enum/rephrase_language.dart';
import '../../model/rephrase/rephrase_result.dart';

abstract class RephraseRemoteRepository {
  Future<RephraseResult> rephraseText(String text, RephraseLanguage language);
}
