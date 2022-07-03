import '../../model/enum/rephrase_language.dart';
import '../../model/result/rephrase/enhanced_rephrase_result.dart';
import '../../model/result/rephrase/rephrase_result.dart';

abstract class RephraseRemoteRepository {
  Future<RephraseResult> rephraseText(String text, RephraseLanguage language);

  Future<EnhancedRephraseResult> enhancedRephraseText(String text);
}
