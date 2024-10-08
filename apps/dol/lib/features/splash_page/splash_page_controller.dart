import 'package:common/core/framework/view_controller.dart';
import 'package:common_dol/core/services/app_service.dart';
import 'package:common_dol/core/services/auth_service.dart';
import 'package:common_dol/core/states/config_state.dart';
import 'package:dol/app_controller.dart';
import 'package:dol/router.dart';

class SplashPageController extends ViewController {
  final ConfigState _configState;
  final AppService _appService;
  final AuthService _authService;
  final AppController _appController;
  final AppRouter appRouter;

  SplashPageController(
    this._configState,
    this._appService,
    this._authService,
    this._appController,
    this.appRouter,
  );

  Future<void> bootstrap() async {
    // Инициализация конфига
    await _configState.init();

    // Инициализация состояния приложения
    await _appService.init();

    // Инициализация авторизации
    await _authService.init();

    _appController.appLoadFinish();
  }
}
