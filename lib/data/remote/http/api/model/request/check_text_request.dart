import 'authorized_request.dart';

class CheckTextRequest extends AuthorizedRequest {
  final String text;

  CheckTextRequest({required this.text, required super.token});

  @override
  Map<String, dynamic> getBody() => {'text': text};
}
