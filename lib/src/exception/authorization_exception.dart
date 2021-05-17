class AuthorizationException implements Exception {
  final String msg;
  const AuthorizationException(this.msg);
  String toString() => 'AuthorizationException: $msg';
}
