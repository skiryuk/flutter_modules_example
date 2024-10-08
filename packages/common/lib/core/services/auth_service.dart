import 'package:common/core/states/auth_state.dart';

/// Сервис для работы с состоянием авторизации
/// Может включать общую логику для работы с авторизацией
abstract class IAuthService {
  final IAuthState _authState;

  IAuthService(
    this._authState,
  );

  IAuthState get authState => _authState;

  Future<void> init() async {
    await _authState.init();
  }

  // Выйти из приложения
  Future<void> logout() async {
    await _authState.clear();
    await _authState.setLoggedIn(false);
  }
}
