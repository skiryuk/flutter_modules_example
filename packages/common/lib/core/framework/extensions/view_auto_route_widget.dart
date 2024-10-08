import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../view_widget.dart';
import 'view_auto_route_controller.dart';

/// ViewWidget, дополненный передачей контроллеру данных из роутинга пакета AutoRoute
abstract class ViewAutoRouteWidget extends ViewWidget {
  const ViewAutoRouteWidget({super.key, super.parentBindings, super.bindings});

  @override
  ViewAutoRouteWidgetState createState() => ViewAutoRouteWidgetState();
}

class ViewAutoRouteWidgetState<TWidget extends ViewAutoRouteWidget,
        TController extends ViewAutoRouteController>
    extends ViewWidgetState<TWidget, TController> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void preInitController() {
    super.preInitController();
    // Получаем Router
    final rootRouter = context.router;
    RouteData routeData;
    // Извлекаем данные
    try {
      routeData = context.routeData;
    } catch (e) {
      routeData = rootRouter.routeData;
    }
    // Передаем данные контроллеру
    controller.setRouteData(routeData, rootRouter);
  }
}
