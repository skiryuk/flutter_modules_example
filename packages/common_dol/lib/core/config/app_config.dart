import 'package:common/core/config/app_config.dart';
import 'package:common/core/config/environment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_config.g.dart';

@JsonSerializable()
class AppConfig extends IAppConfig {
  AppConfig({
    required super.environment,
    required super.apiBaseUrl,
    super.extraHeaders,
  });

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AppConfigToJson(this);
}
