import 'package:common/core/states/config_state.dart';
import 'package:common/core/storage/local_storage.dart';

import '../config/app_config.dart';

class ConfigState extends IConfigState {
  final ILocalStorage localStorage;
  final AppConfig defaultConfig;
  final List<AppConfig> configs;

  ConfigState(
    this.localStorage,
    this.defaultConfig,
    this.configs,
  ) : super(
          localStorage,
          defaultConfig,
          configs,
        );
}
