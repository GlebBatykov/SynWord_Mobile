import 'authorized_request.dart';

class GetTextFromDocxRequest extends AuthorizedRequest {
  final String binary;

  GetTextFromDocxRequest({required this.binary, required super.token});

  @override
  Map<String, dynamic> getBody() => {'File': binary};
}
