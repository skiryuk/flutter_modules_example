import 'package:rx_notifier/rx_notifier.dart';

/// Состояние ошибок приложения (храним последнюю ошибки приложения)
abstract class ILogState {
  final _lastError = RxNotifier<dynamic>(null);
  final _lastErrorId = RxNotifier<String?>(null);
  final _lastErrorStackTrace = RxNotifier<StackTrace?>(null);

  StackTrace? get lastErrorStackTrace => _lastErrorStackTrace.value;
  set lastErrorStackTrace(StackTrace? trace) =>
      _lastErrorStackTrace.value = trace;

  String? get lastErrorId => _lastErrorId.value;
  set lastErrorId(String? id) => _lastErrorId.value = id;

  dynamic get lastError => _lastError.value;
  set lastError(dynamic error) => _lastError.value = error;

  void clearError() {
    _lastError.value = null;
    _lastErrorId.value = null;
    _lastErrorStackTrace.value = null;
  }
}
