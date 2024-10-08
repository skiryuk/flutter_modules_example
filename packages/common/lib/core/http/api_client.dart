import 'package:dio/dio.dart';

/// Http клиент, обертка над пакетом Dio,
/// предоставляющая базовые http методы
class ApiClient {
  // URL для доступа в API
  final String baseUrl;
  // Обязательные заголовки
  Map<String, String>? headers;
  // Интерсепторы
  final List<Interceptor> interceptors;
  // Транформеры
  final Transformer? transformer;
  // Таймаут соединения
  final int connectTimeout;

  final Dio instance = Dio();

  ApiClient({
    required this.baseUrl,
    this.headers,
    required this.connectTimeout,
    this.interceptors = const [],
    this.transformer,
  }) {
    instance
      ..options.baseUrl = baseUrl
      ..options.headers = headers
      ..options.connectTimeout = Duration(milliseconds: connectTimeout)
      ..transformer = (transformer ?? BackgroundTransformer())
      ..interceptors.addAll(interceptors);
  }
}
