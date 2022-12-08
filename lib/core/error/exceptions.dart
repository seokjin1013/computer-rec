class ServerException implements Exception {
  final int errorCode;

  ServerException([this.errorCode = -1]);
}
