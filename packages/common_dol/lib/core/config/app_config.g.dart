// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => AppConfig(
      environment:
          Environment.fromJson(json['environment'] as Map<String, dynamic>),
      apiBaseUrl: json['apiBaseUrl'] as String,
      extraHeaders: (json['extraHeaders'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
    );

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) => <String, dynamic>{
      'environment': instance.environment,
      'apiBaseUrl': instance.apiBaseUrl,
      'extraHeaders': instance.extraHeaders,
    };
