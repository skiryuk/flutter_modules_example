import 'package:common/core/framework/view_binding.dart';

import 'ao_detail_controller.dart';

class AoDetailBindings extends ViewBindings {
  @override
  void register() {
    registerSingleton(AoDetailController());
  }
}
