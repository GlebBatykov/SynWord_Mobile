abstract class EmailRemoteRepository {
  Future<void> confirm(String confirmationCode);

  Future<void> sendConfirmationCode();
}
