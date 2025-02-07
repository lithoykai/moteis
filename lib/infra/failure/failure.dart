interface class Failure {}

class ServerFailure implements Failure {
  String? msg;
  int? statusCode;

  ServerFailure({this.msg, this.statusCode});

  @override
  String toString() {
    return msg ?? '';
  }
}
