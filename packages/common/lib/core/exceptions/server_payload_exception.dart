/// Класс ошибки с сервера, которую нужно показать в интерфейсе
class ServerPayloadException implements Exception {
  final String? _message;

  ServerPayloadException(this._message);

  @override
  String toString() {
    return _message ?? '';
  }
}
