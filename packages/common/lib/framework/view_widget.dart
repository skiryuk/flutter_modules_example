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
    controller = bindings.get<TController>();
    preInitController();
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
  void preInitController() {
    /// Устанавливаем в контроллер ссылку на биндинг
    // controller.setBindings(bindings);
  }

  @override
  void dispose() {
    controller.onDispose();
    super.dispose();
  }
}
