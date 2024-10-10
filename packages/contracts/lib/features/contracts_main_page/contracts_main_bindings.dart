import 'package:common/core/framework/view_binding.dart';
import 'package:contracts/contracts_state.dart';

import 'contracts_main_controller.dart';

class ContractsMainBindings extends ViewBindings {
  @override
  void register() {
    registerSingleton(
      ContractsMainController(
        get<ContractsState>(),
      ),
    );
  }
}
