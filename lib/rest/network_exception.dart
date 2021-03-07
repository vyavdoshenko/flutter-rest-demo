class NetworkException implements Exception {
  final dynamic message;

  NetworkException([this.message]);

  String toString() {
    var message = this.message;
    if (message == null) {
      return "NetworkException";
    }
    return "NetworkException: $message";
  }
}
