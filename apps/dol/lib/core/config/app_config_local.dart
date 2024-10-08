import 'package:common_dol/core/config/app_config.dart';

import 'environments.dart';

class AppConfigLocal extends AppConfig {
  AppConfigLocal()
      : super(
          apiBaseUrl: "http://192.168.1.1:3000",
          environment: Environments.LOCAL,
        );
}
