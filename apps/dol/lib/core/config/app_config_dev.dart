import 'package:common_dol/core/config/app_config.dart';
import 'environments.dart';

class AppConfigDev extends AppConfig {
  AppConfigDev()
      : super(
          apiBaseUrl: 'https://pokeapi.co',
          environment: Environments.DEV,
        );
}
