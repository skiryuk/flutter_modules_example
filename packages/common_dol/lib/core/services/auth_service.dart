import 'package:common/core/services/auth_service.dart';
import '../states/auth_state.dart';

class AuthService extends IAuthService {
  final AuthState _authState;

  AuthService(
    this._authState,
  ) : super(_authState);

  @override
  AuthState get authState => _authState;

  @override
  Future<void> init() async {
    await _authState.init();
    // ...
  }

  // Выйти из приложения
  @override
  Future<void> logout() async {
    _authState.clear();
    await super.logout();
  }
}
