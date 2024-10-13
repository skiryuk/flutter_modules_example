import 'package:common/core/framework/extensions/view_auto_route_controller.dart';

class AoMainController extends ViewAutoRouteController {
  String? get id => (routeData!.args as dynamic).id as String?;
}
