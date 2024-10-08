import 'package:common/core/states/app_state.dart';

/// Сервис для работы с состоянием приложения
/// Может включать общую логику для работы приложения
abstract class IAppService {
  final IAppState _appState;

  IAppService(
    this._appState,
  );

  Future<void> init() async {
    await _appState.init();
  }
}
