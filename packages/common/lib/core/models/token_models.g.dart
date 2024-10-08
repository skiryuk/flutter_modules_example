// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      token: json['token'] as String,
      expiresSeconds: (json['expiresSeconds'] as num).toInt(),
      expiredDate: Token._fromDateTimeJson(json['expiredDate'] as String?),
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'token': instance.token,
      'expiresSeconds': instance.expiresSeconds,
      'expiredDate': Token._toDateTimeJson(instance.expiredDate),
    };

RefreshTokenInputDto _$RefreshTokenInputDtoFromJson(
        Map<String, dynamic> json) =>
    RefreshTokenInputDto(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      deviceToken: json['deviceToken'] as String?,
    );

Map<String, dynamic> _$RefreshTokenInputDtoToJson(
        RefreshTokenInputDto instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'deviceToken': instance.deviceToken,
    };

RefreshTokenOutputDto _$RefreshTokenOutputDtoFromJson(
        Map<String, dynamic> json) =>
    RefreshTokenOutputDto(
      refresh: Token.fromJson(json['refresh'] as Map<String, dynamic>),
      access: Token.fromJson(json['access'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RefreshTokenOutputDtoToJson(
        RefreshTokenOutputDto instance) =>
    <String, dynamic>{
      'refresh': instance.refresh,
      'access': instance.access,
    };
