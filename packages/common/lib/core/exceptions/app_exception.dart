/// Класс ошибки работы приложения
class AppException implements Exception {
  final String? _message;
  final StackTrace? _stackTrace;

  AppException([this._message, this._stackTrace]);

  @override
  String toString() {
    return _message ?? '';
  }

  StackTrace? get stackTrace => _stackTrace;
}
