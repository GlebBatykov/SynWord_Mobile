import 'package:synword/domain/model/enum/rephrase_language.dart';

enum ItemLanguage {
  russian('English', 'ENG', RephraseLanguage.eng),
  english('Russian', 'RUS', RephraseLanguage.rus);

  final String title;

  final String shortTitle;

  final RephraseLanguage rephraseLanguage;

  const ItemLanguage(this.title, this.shortTitle, this.rephraseLanguage);
}
