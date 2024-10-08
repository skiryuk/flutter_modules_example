import 'dart:async';
import 'dart:convert';

import 'package:common/core/states/auth_state.dart';
import 'package:common/core/storage/local_storage.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../models/user_models.dart';

class AuthState extends IAuthState {
  final ILocalStorage _localStorage;

  static const SESSION_ID = 'sessionId';
  static const USER_INFO = 'userInfo';
  static const LAST_LOGIN = 'lastLogin';

  final _sessionId = RxNotifier<String?>(null);
  String? get sessionId => _sessionId.value;

  final _userInfo = RxNotifier<UserModel?>(null);
  UserModel? get userInfo => _userInfo.value;

  final _lastLogin = RxNotifier<String?>(null);
  String? get lastLogin => _lastLogin.value;

  AuthState(this._localStorage) : super(_localStorage);

  @override
  Future<void> init() async {
    await super.init();
    await restoreSessionId();
    await restoreUserInfo();
    await restoreLastLogin();
  }

  Future<void> setSessionId(String? sessionId) async {
    _sessionId.value = sessionId;
    await _localStorage.put(SESSION_ID, sessionId);
  }

  Future<void> setUserInfo(UserModel? userInfo) async {
    _userInfo.value = userInfo;
    await _localStorage.put(
        USER_INFO, userInfo != null ? json.encode(userInfo.toJson()) : null);
  }

  Future<void> setLastLogin(String? lastLogin) async {
    _lastLogin.value = lastLogin;
    await _localStorage.put(LAST_LOGIN, lastLogin);
  }

  Future<void> restoreSessionId() async {
    _sessionId.value = await _localStorage.get(SESSION_ID);
  }

  Future<void> restoreUserInfo() async {
    String? userInfo = await _localStorage.get(USER_INFO);
    _userInfo.value =
        userInfo != null ? UserModel.fromJson(json.decode(userInfo)) : null;
  }

  Future<void> restoreLastLogin() async {
    _lastLogin.value = await _localStorage.get(LAST_LOGIN);
  }

  Future<void> clearSessionId() async {
    _sessionId.value = null;
    await _localStorage.delete(SESSION_ID);
  }

  Future<void> clearUserInfo() async {
    _userInfo.value = null;
    await _localStorage.delete(USER_INFO);
  }

  Future<void> clearLastLogin() async {
    _lastLogin.value = null;
    await _localStorage.delete(LAST_LOGIN);
  }

  @override
  Future<void> clear() async {
    await super.clear();
    await clearSessionId();
    await clearUserInfo();
  }
}
