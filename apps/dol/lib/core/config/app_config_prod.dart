import 'package:common_dol/core/config/app_config.dart';

import 'environments.dart';

class AppConfigProd extends AppConfig {
  AppConfigProd()
      : super(
          apiBaseUrl: 'https://pokeapi.co',
          environment: Environments.PROD,
        );
}
