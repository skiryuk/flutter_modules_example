import 'package:common/core/services/log_service.dart';
import 'package:common/core/states/log_state.dart';
import 'package:common_dol/core/states/auth_state.dart';
import 'package:common_dol/core/states/log_state.dart';

class LogService extends ILogService {
  final LogState _logState;
  final AuthState _authState;

  LogService(
    this._logState,
    this._authState,
  ) : super(_logState);

  @override
  ILogState get state => _logState;

  String? get useEmail => _authState.userInfo?.email;
}
