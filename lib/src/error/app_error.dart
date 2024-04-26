class AppException implements Exception {
  final String message;
  final dynamic data;

  AppException({required this.message, this.data});

  Map<String, dynamic> toJson() {
    return {message: message, data: data};
  }
}
