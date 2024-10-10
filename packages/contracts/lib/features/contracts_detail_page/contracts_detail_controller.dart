import 'package:common/core/framework/extensions/view_auto_route_controller.dart';
import 'package:common_dol/core/services/app_service.dart';
import 'package:contracts/contracts_state.dart';

import 'contracts_detail_state.dart';

class ContractsDetailController extends ViewAutoRouteController {
  final AppService _appService;
  final ContractsState _contractsState;
  final ContractsDetailState _state;

  ContractsDetailController(
    this._appService,
    this._contractsState,
    this._state,
  );

  String? get simNumber => _contractsState.simNumber.value;

  String? get phone => _state.phone.value;

  String? get appVersion => _appService.state.appVersion;

  set phone(String? num) => _state.phone.value = num;
}
