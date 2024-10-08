import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

import 'environment.dart';

part 'app_config.g.dart';

/// Базовый класс конфига приложения
@JsonSerializable()
class IAppConfig {
  // Идентификатор сред (dev, test, prod)
  final Environment environment;
  // URL к API
  final String apiBaseUrl;
  // Заголовки, которые передавать с каждым запросом
  final Map<String, String> extraHeaders;

  IAppConfig({
    required this.environment,
    required this.apiBaseUrl,
    this.extraHeaders = const {},
  });

  factory IAppConfig.fromJson(Map<String, dynamic> json) =>
      _$IAppConfigFromJson(json);

  Map<String, dynamic> toJson() => _$IAppConfigToJson(this);

  Map<String, String> get headers => _getAllHeaders(extraHeaders);

  Map<String, String> _getAllHeaders(Map<String, String> customHeaders) {
    return {
      'X-TYPE': 'mobile',
      'X-DEVICE': _platformName,
    }..addAll(customHeaders);
  }

  String get _platformName {
    return Platform.isIOS
        ? 'iOS'
        : Platform.isAndroid
            ? 'Android'
            : 'Unknown';
  }
}
