import 'authorized_request.dart';

class ConfirmEmailRequest extends AuthorizedRequest {
  final String confirmationCode;

  ConfirmEmailRequest({required this.confirmationCode, required super.token});

  @override
  Map<String, dynamic> getBody() => {'ConfirmationCode': confirmationCode};
}
