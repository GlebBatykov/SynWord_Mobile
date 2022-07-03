import 'package:synword/data/remote/http/api/model/request/authorized_request.dart';

class EnhancedRephraseTextRequest extends AuthorizedRequest {
  final String text;

  EnhancedRephraseTextRequest({required this.text, required super.token});

  @override
  Map<String, dynamic> getBody() => {'Text': text};
}
