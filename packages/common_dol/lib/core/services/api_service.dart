import 'package:common/core/services/api_service.dart';
import 'package:common/core/services/log_service.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

import '../states/app_state.dart';
import '../states/auth_state.dart';
import '../states/config_state.dart';

/// Сервис обращения к API
class ApiService extends IApiService {
  /// Состояние с конфигурацией и настройками
  final ConfigState configState;

  /// Состояние приложения
  final AppState _appState;

  /// Состояние авторизации
  final AuthState _authState;

  final ILogService _logService;

  ApiService(
    this.configState,
    this._appState,
    this._authState,
    this._logService,
  ) : super(configState);

  @override
  void onConfigure() {
    super.onConfigure();
    apiClient.instance.interceptors.addAll(kDebugMode
        ? [LogInterceptor(requestBody: true, responseBody: true)]
        : []);
  }
}
