import '../../../../../../domain/model/enum/rephrase_language.dart';

import 'authorized_request.dart';

class RephraseTextRequest extends AuthorizedRequest {
  final String text;

  final RephraseLanguage language;

  RephraseTextRequest(
      {required this.text, required this.language, required super.token});

  @override
  Map<String, dynamic> getBody() => {'text': text, 'language': language.name};
}
