import 'package:json_annotation/json_annotation.dart';

part 'token_models.g.dart';

/// Модель токена авторизации
@JsonSerializable()
class Token {
  final String token;
  final int expiresSeconds;

  @JsonKey(fromJson: _fromDateTimeJson, toJson: _toDateTimeJson)
  final DateTime? expiredDate;

  Token({
    required this.token,
    required this.expiresSeconds,
    expiredDate,
  }) : expiredDate = (expiredDate ??
            (expiredDate =
                DateTime.now().add(Duration(seconds: expiresSeconds))));

  bool get isExpired =>
      expiredDate == null || DateTime.now().isAfter(expiredDate!);

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);

  static DateTime? _fromDateTimeJson(String? value) =>
      value != null ? DateTime.parse(value).toLocal() : null;

  static String? _toDateTimeJson(DateTime? value) => value?.toIso8601String();
}

@JsonSerializable()
class RefreshTokenInputDto {
  final String accessToken;
  final String refreshToken;
  final String? deviceToken;

  RefreshTokenInputDto({
    required this.accessToken,
    required this.refreshToken,
    this.deviceToken,
  });

  factory RefreshTokenInputDto.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenInputDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenInputDtoToJson(this);
}

@JsonSerializable()
class RefreshTokenOutputDto {
  final Token refresh;
  final Token access;

  RefreshTokenOutputDto({
    required this.refresh,
    required this.access,
  });

  factory RefreshTokenOutputDto.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenOutputDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenOutputDtoToJson(this);
}
