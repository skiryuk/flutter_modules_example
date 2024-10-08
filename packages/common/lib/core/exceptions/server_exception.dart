import 'package:dio/dio.dart';

/// Класс серверной ошибки
class ServerException implements Exception {
  final DioException error;
  final StackTrace? stackTrace;

  ServerException(this.error, [this.stackTrace]);

  @override
  String toString() {
    return error.toString();
  }
}
