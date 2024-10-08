import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

import 'view_base_widget.dart';
import 'view_controller.dart';

/// Расширенный контроллером класс ViewBaseWidget
abstract class ViewWidget extends ViewBaseWidget {
  const ViewWidget({
    super.key,
    super.parentBindings,
    super.bindings,
  });

  @override
  ViewWidgetState createState() => ViewWidgetState();
}

class ViewWidgetState<TWidget extends ViewWidget,
    TController extends ViewController> extends ViewBaseWidgetState<TWidget> {
  late TController controller;

  @override
  void initState() {
    super.initState();
    // Получаем зарегистрированный ранее контроллер из контейнера
    controller = bindings.get<TController>();
    // Хук на операции до инициализации контроллера
    preInitController();
    // Инициализируем контроллер
    controller.onInit();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => controller.onReady(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @protected
  //@mustCallSuper
  void preInitController() {}

  @override
  void dispose() {
    controller.onDispose();
    super.dispose();
  }
}
