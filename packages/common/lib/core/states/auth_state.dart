import 'dart:async';

import 'package:common/core/models/token_models.dart';
import 'package:common/core/states/hydrated_state.dart';
import 'package:common/core/storage/local_storage.dart';
import 'package:rx_notifier/rx_notifier.dart';

/// Состояние авторизации
/// Хранит общие данные для авторизации и пользователе
/// Не включает логику (только хранение данных)
abstract class IAuthState extends HydratedState {
  IAuthState(ILocalStorage localStorage)
      : super(
          localStorage,
          isAutoInit: false,
        );

  @override
  final stateKey = 'auth-state';

  @override
  Future<void> init() async {
    await super.init();
  }

  static const ACCESS_TOKEN = 'accessToken';
  static const REFRESH_TOKEN = 'refreshToken';
  static const LOGGED_IN = 'loggedIn';

  // Токены авторизации
  final _accessToken = RxNotifier<Token?>(null);
  final _refreshToken = RxNotifier<Token?>(null);
  // Признак авторизации пользователя
  final _isLoggedIn = RxNotifier<bool?>(null);

  Token? get accessToken => _accessToken.value;
  Token? get refreshToken => _refreshToken.value;
  bool get isLoggedIn => _isLoggedIn.value ?? false;

  Future<void> setAccessToken(Token? token) async {
    _accessToken.value = token;
    await save();
  }

  Future<void> setRefreshToken(Token? token) async {
    _refreshToken.value = token;
    await save();
  }

  Future<void> setLoggedIn(bool? loggedIn) async {
    _isLoggedIn.value = loggedIn;
    await save();
  }

  Future<void> clear() async {
    _accessToken.value = null;
    _refreshToken.value = null;
    _isLoggedIn.value = null;
    await save();
  }

  @override
  void fromJson(Map<String, dynamic> jsonMap) {
    final accessToken = jsonMap[ACCESS_TOKEN];
    final refreshToken = jsonMap[REFRESH_TOKEN];
    _accessToken.value =
        accessToken != null ? Token.fromJson(accessToken) : null;
    _refreshToken.value =
        refreshToken != null ? Token.fromJson(refreshToken) : null;
    _isLoggedIn.value = jsonMap[LOGGED_IN];
  }

  @override
  Map<String, dynamic> toJson() => {
        ACCESS_TOKEN: _accessToken.value,
        REFRESH_TOKEN: _refreshToken.value,
        LOGGED_IN: _isLoggedIn.value,
      };
}
