import 'package:common/core/framework/view_binding.dart';
import 'package:dol/router.dart';

import 'app_controller.dart';

class AppBindings extends ViewBindings {
  @override
  void register() {
    registerSingleton<AppController>(
      AppController(
        get<AppRouter>(),
      ),
    );
  }
}
