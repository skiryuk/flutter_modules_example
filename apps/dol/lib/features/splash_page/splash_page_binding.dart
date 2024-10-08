import 'package:common/core/framework/view_binding.dart';
import 'package:common_dol/core/services/app_service.dart';
import 'package:common_dol/core/services/auth_service.dart';
import 'package:common_dol/core/states/config_state.dart';
import 'package:dol/app_controller.dart';
import 'package:dol/router.dart';

import 'splash_page_controller.dart';

class SplashPageBinding extends ViewBindings {
  @override
  void register() {
    registerSingleton(
      SplashPageController(
        get<ConfigState>(),
        get<AppService>(),
        get<AuthService>(),
        get<AppController>(),
        get<AppRouter>(),
      ),
    );
  }
}
