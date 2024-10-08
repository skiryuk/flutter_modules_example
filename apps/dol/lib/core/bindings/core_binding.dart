import 'package:get_it/get_it.dart';
import 'package:dol/router.dart';
import 'package:dol/core/config/environments.dart';
import 'package:common/core/storage/local_storage.dart';
import 'package:common/core/storage/shared_preferences_storage.dart';
import 'package:common_dol/core/config/app_config.dart';
import 'package:common_dol/core/states/config_state.dart';
import 'package:common_dol/core/states/log_state.dart';
import 'package:common_dol/core/states/app_state.dart';
import 'package:common_dol/core/states/auth_state.dart';
import 'package:common_dol/core/services/log_service.dart';
import 'package:common_dol/core/services/app_service.dart';
import 'package:common_dol/core/services/api_service.dart';
import 'package:common_dol/core/services/auth_service.dart';

class CoreBinding {
  final AppConfig? appConfig;

  CoreBinding([this.appConfig]);

  Future<void> dependencies() async {
    GetIt.I.registerSingleton<AppRouter>(AppRouter());
    GetIt.I.registerSingleton<ILocalStorage>(SharedPreferencesStorage());
    GetIt.I.registerSingleton<ConfigState>(ConfigState(
        GetIt.I.get<ILocalStorage>(),
        appConfig ?? Environments.byDefaultConfig,
        Environments.configs));
    GetIt.I.registerSingleton<LogState>(LogState());
    GetIt.I.registerSingleton<AppState>(AppState(GetIt.I.get<ILocalStorage>()));
    GetIt.I
        .registerSingleton<AuthState>(AuthState(GetIt.I.get<ILocalStorage>()));
    GetIt.I.registerSingleton<LogService>(LogService(
      GetIt.I.get<LogState>(),
      GetIt.I.get<AuthState>(),
    ));
    GetIt.I.registerSingleton<AppService>(AppService(GetIt.I.get<AppState>()));

    GetIt.I.registerSingleton<ApiService>(
      ApiService(
        GetIt.I.get<ConfigState>(),
        GetIt.I.get<AppState>(),
        GetIt.I.get<AuthState>(),
        GetIt.I.get<LogService>(),
      ),
    );

    GetIt.I.registerSingleton<AuthService>(
      AuthService(
        GetIt.I.get<AuthState>(),
      ),
    );
  }
}
