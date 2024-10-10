import 'package:common/core/framework/view_binding.dart';
import 'package:common_dol/core/services/app_service.dart';
import 'package:contracts/contracts_state.dart';

import 'contracts_detail_controller.dart';
import 'contracts_detail_state.dart';

class ContractsDetailBindings extends ViewBindings {
  @override
  void register() {
    registerSingleton(ContractsDetailState());
    registerSingleton(ContractsDetailController(
      get<AppService>(),
      get<ContractsState>(),
      get<ContractsDetailState>(),
    ));
  }
}
