// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IAppConfig _$IAppConfigFromJson(Map<String, dynamic> json) => IAppConfig(
      environment:
          Environment.fromJson(json['environment'] as Map<String, dynamic>),
      apiBaseUrl: json['apiBaseUrl'] as String,
      extraHeaders: (json['extraHeaders'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
    );

Map<String, dynamic> _$IAppConfigToJson(IAppConfig instance) =>
    <String, dynamic>{
      'environment': instance.environment,
      'apiBaseUrl': instance.apiBaseUrl,
      'extraHeaders': instance.extraHeaders,
    };
