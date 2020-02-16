class LoginException implements Exception {
  @override
  String toString() {
    return 'Error occurs when login. Please try again.';
  }
}

class ConnectionException implements Exception {
  @override
  String toString() {
    return 'Network connection error.';
  }
}
