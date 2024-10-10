import 'package:common/core/framework/extensions/view_auto_route_controller.dart';
import 'package:contracts/contracts_state.dart';

class ContractsMainController extends ViewAutoRouteController {
  final ContractsState _contractsState;

  ContractsMainController(this._contractsState);

  String? get simNumber => _contractsState.simNumber.value;

  set simNumber(String? num) => _contractsState.simNumber.value = num;
}
