import '../../../../domain/repository/remote/email_remote_repository.dart';
import '../../../../domain/use_case/get_token_use_case.dart';
import 'model/request/authorized_request.dart';
import 'model/request/confirm_email_request.dart';
import 'service/email/confirm_email_service.dart';
import 'service/email/send_confirmation_code_service.dart';

class ApiEmailRepository extends EmailRemoteRepository {
  @override
  Future<void> sendConfirmationCode() async {
    var token = await GetTokenUseCase().getToken();

    var request = AuthorizedRequest(token: token.token);

    await SendConfirmationCodeService().send(request);
  }

  @override
  Future<void> confirm(String confirmationCode) async {
    var token = await GetTokenUseCase().getToken();

    var request = ConfirmEmailRequest(
        confirmationCode: confirmationCode, token: token.token);

    await ConfirmEmailService().confirm(request);
  }
}
