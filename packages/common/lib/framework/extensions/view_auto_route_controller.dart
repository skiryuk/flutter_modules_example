import 'package:auto_route/auto_route.dart';

import '../view_controller.dart';

/// Стандартный контроллер насыщенный информацией о роуте (аргументы, параметры и т.д)
class ViewAutoRouteController extends ViewController {
  late RouteData? routeData;
  late StackRouter? rootRouter;

  void setRouteData(RouteData? routeData, StackRouter? rootRouter) {
    this.routeData = routeData;
    this.rootRouter = rootRouter;
  }
}
