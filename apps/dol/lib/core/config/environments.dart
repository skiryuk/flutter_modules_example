import 'package:common_dol/core/config/app_config.dart';
import 'package:common/core/config/environment.dart';

import 'app_config_dev.dart';
import 'app_config_local.dart';
import 'app_config_prod.dart';
import 'app_config_test.dart';

class Environments {
  static const DEV = Environment("dev", "dev");
  static const TEST = Environment("test", "test");
  static const PROD = Environment("prod", "PRODUCTION");
  static const LOCAL = Environment("local", "local");

  static Environment get byDefault => PROD;

  static AppConfig get byDefaultConfig => findConfigByKey(PROD.key);

  static AppConfig findConfigByKey(String key) {
    return configs.firstWhere((c) => c.environment.key == key);
  }

  static List<AppConfig> configs = [
    AppConfigDev(),
    AppConfigTest(),
    AppConfigProd(),
    AppConfigLocal(),
  ];
}
