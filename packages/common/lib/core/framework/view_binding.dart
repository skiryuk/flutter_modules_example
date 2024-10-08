import 'package:get_it/get_it.dart';

/// Класс зависимости
class _Binding {
  final Object instance;
  final String? instanceName;

  _Binding(this.instance, [this.instanceName]);
}

/// Вспомогательный класс DI контейнера (биндинга)
abstract class ViewBindings {
  // Временно храним зависимости для внутренних нужд
  final List<_Binding> _bindings = [];

  // Создаем новый инстанс GetIt (изоляция зависимостей внутри фичи)
  final getIt = GetIt.asNewInstance();

  /// Родительский контейнер
  late ViewBindings? parentBindings;

  setParentBindings(ViewBindings? viewBindings) {
    parentBindings = viewBindings;
  }

  /// Метод регистрации зависимостей
  void register();

  /// Метод очистки зависимостей
  void unregister() {
    for (final _Binding b in _bindings.reversed) {
      getIt.unregister(instance: b.instance, instanceName: b.instanceName);
      print(
        'removed dependency: ${b.instanceName ?? b.instance.runtimeType.toString()}',
      );
    }
  }

  /// Метод регистрации зависимости
  void registerSingleton<T extends Object>(
    T instance, {
    String? instanceName,
    bool? signalsReady,
    DisposingFunc<T>? dispose,
  }) {
    getIt.registerSingleton(
      instance,
      instanceName: instanceName,
      signalsReady: signalsReady,
      dispose: dispose,
    );
    _bindings.add(
      _Binding(
        instance,
        instanceName,
      ),
    );
    print(
      'added dependency: ${T.toString()}${instanceName != null ? ', instanceName: $instanceName' : ''}',
    );
  }

  /// Метод проверки на наличие уже зарегистрированной зависимости
  bool isRegistered<T extends Object>({
    Object? instance,
    String? instanceName,
  }) {
    return getIt.isRegistered<T>(
      instance: instance,
      instanceName: instanceName,
    );
  }

  /// Получить зарегистрированную ранее зависимость,
  /// сначала ищет в текущем контейнере, если не находит то ищем в родительском
  /// и так по цепочке наверх пока не дойдем до root
  T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    if (getIt.isRegistered<T>(instanceName: instanceName)) {
      return getIt.get<T>(
        instanceName: instanceName,
        param1: param1,
        param2: param2,
      );
    } else if (parentBindings != null) {
      return parentBindings!.get<T>(
        instanceName: instanceName,
        param1: param1,
        param2: param2,
      );
    } else if (GetIt.I.isRegistered<T>(instanceName: instanceName)) {
      return GetIt.I<T>(
        instanceName: instanceName,
        param1: param1,
        param2: param2,
      );
    }
    throw Exception('Dependency not found');
  }
}
