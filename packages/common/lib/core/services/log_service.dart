import 'package:common/core/states/log_state.dart';
import 'package:uuid/uuid.dart';

/// Сервис для логирования
abstract class ILogService {
  final ILogState _logState;

  ILogService(
    this._logState,
  );

  ILogState get state => _logState;

  void logError(dynamic error, [StackTrace? stackTrace]) async {
    _logState.lastErrorId = const Uuid().v4();
    _logState.lastErrorStackTrace = stackTrace;
    _logState.lastError = error;
  }

  void clearError() {
    _logState.clearError();
  }
}
