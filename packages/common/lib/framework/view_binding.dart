import 'package:get_it/get_it.dart';

class _Binding {
  final Object instance;
  final String? instanceName;

  _Binding(this.instance, [this.instanceName]);
}

abstract class ViewBindings {
  /// Временно храним зависимости для внутренних нужд
  final List<_Binding> _bindings = [];

  final getIt = GetIt.asNewInstance();

  /// Родительский биндинг
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
  /// обходит родительские биндинги если не находит в текущем,
  /// если и там не находит ищет в глобальной области
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
