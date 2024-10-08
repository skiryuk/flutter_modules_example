import 'package:common_dol/core/config/app_config.dart';
import 'environments.dart';

class AppConfigTest extends AppConfig {
  AppConfigTest()
      : super(
          apiBaseUrl: 'https://pokeapi.co',
          environment: Environments.TEST,
        );
}
