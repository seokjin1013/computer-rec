abstract class Failure {
  final String message;
  Failure([this.message = ""]);
}

class ServerFailure extends Failure {
  final int errorCode;
  ServerFailure({this.errorCode = -1})
      : super('서버와 연결되어있지 않습니다. 에러코드: $errorCode');
}

class ConnectionFailure extends Failure {
  ConnectionFailure() : super('인터넷에 연결되어있지 않습니다.');
}
