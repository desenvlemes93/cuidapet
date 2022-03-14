class UserExistsException implements Exception {
  final String? message;
  UserExistsException({
    this.message,
  });

  @override
  String toString() => 'UserExistsException(message: $message)';
}
