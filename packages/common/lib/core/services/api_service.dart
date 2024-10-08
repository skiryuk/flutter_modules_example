import 'package:common/core/http/api_client.dart';
import 'package:common/core/states/config_state.dart';
import 'package:dio/dio.dart';

/// Сервис обращения к API
abstract class IApiService {
  /// Состояние с конфигурацией и настройками
  final IConfigState _configState;

  /// Http клиент
  late ApiClient apiClient;

  final Transformer? transformer;

  IApiService(this._configState, {this.transformer}) {
    // Подписываемся на изменение конфига
    // и пересоздаем клиент в случае его изменения
    _configState.addConfigChangeListener((_) => _configure());
  }

  /// Инстанс для общения по http
  Dio get instance => apiClient.instance;

  /// Метод создания Http клиента
  void _configure() async {
    if (_configState.config != null) {
      apiClient = ApiClient(
        baseUrl: _configState.config!.apiBaseUrl,
        headers: _configState.config!.headers,
        connectTimeout: 35 * 1000,
        transformer: transformer,
      );
      onConfigure();
    }
  }

  void onConfigure() {}
}
