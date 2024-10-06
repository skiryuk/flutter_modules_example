import 'package:flutter/cupertino.dart';
import 'view_binding.dart';

/// Базовый класс виджет с биндингом
abstract class ViewBaseWidget extends StatefulWidget {
  final ViewBindings? parentBindings;
  final ViewBindings? bindings;

  const ViewBaseWidget({
    Key? key,
    this.parentBindings,
    this.bindings,
  }) : super(key: key);

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
    // Получение биндинга ближайшего родительского виджета
    final parentBindings = widget.parentBindings ??
        context.findAncestorStateOfType<ViewBaseWidgetState>()?.bindings;

    // Создаем биндинг из переданного в конструкторе,
    // либо из дефолтного в виджете
    bindings = widget.bindings ?? widget.createBindings();

    // Установка родительского биндинга
    bindings.setParentBindings(parentBindings);

    // Регистрация зависимостей в текущем биндинге
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
