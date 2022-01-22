part of poseidon;

class PoseidonException implements Exception {
  final String? message;

  PoseidonException({this.message});

  @override
  String toString() {
    if (message != null) {
      return runtimeType.toString() + ': ' + message!;
    } else {
      return super.toString();
    }
  }
}
