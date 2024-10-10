import 'package:common/core/framework/view_binding.dart';
import 'package:contracts/contracts_controller.dart';
import 'package:contracts/contracts_state.dart';

class ContractsBindings extends ViewBindings {
  @override
  void register() {
    registerSingleton(ContractsState());
    registerSingleton(ContractsController());
  }
}
