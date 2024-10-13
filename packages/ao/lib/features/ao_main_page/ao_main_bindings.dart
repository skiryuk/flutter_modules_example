import 'package:common/core/framework/view_binding.dart';

import 'ao_main_controller.dart';

class AoMainBindings extends ViewBindings {
  @override
  void register() {
    registerSingleton(AoMainController());
  }
}
