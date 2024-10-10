import 'package:common/core/services/app_service.dart';
import 'package:common_dol/core/states/app_state.dart';

class AppService extends IAppService {
  final AppState _appState;

  AppService(
    this._appState,
  ) : super(_appState);

  AppState get state => _appState;
}
