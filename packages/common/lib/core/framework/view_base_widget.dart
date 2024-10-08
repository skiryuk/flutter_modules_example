import 'package:flutter/cupertino.dart';
import 'view_binding.dart';

/// Базовый класс виджет с контейнером
abstract class ViewBaseWidget extends StatefulWidget {
  final ViewBindings? parentBindings;
  final ViewBindings? bindings;

  const ViewBaseWidget({
    super.key,
    this.parentBindings,
    this.bindings,
  });

  @override
  State<ViewBaseWidget> createState() => ViewBaseWidgetState();

  ViewBindings createBindings();
}

class ViewBaseWidgetState<TWidget extends ViewBaseWidget>
    extends State<ViewBaseWidget> {
  late ViewBindings bindings;

  @override
  TWidget get widget => super.widget as TWidget;

  @override
  void initState() {
    super.initState();
    // Получение контейнера ближайшего родительского виджета в иерархии
    final parentBindings = widget.parentBindings ??
        context.findAncestorStateOfType<ViewBaseWidgetState>()?.bindings;

    // Создаем контейнер из переданного в конструкторе,
    // либо из дефолтного в виджете
    bindings = widget.bindings ?? widget.createBindings();

    // Установка родительского контейнера
    bindings.setParentBindings(parentBindings);

    // Регистрация заявленных зависимостей в текущем контейнере
    bindings.register();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void dispose() {
    bindings.unregister();
    super.dispose();
  }
}
