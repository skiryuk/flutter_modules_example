import 'dart:async';

import 'package:collection/collection.dart';
import 'package:common/core/config/app_config.dart';
import 'package:common/core/storage/local_storage.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'hydrated_state.dart';

abstract class IConfigState extends HydratedState {
  final IAppConfig defaultConfig;
  final List<IAppConfig> configs;
  final ILocalStorage localStorage;

  final _config = RxNotifier<IAppConfig?>(null);

  IConfigState(
    this.localStorage,
    this.defaultConfig,
    this.configs,
  ) : super(
          localStorage,
          isAutoInit: false,
        );

  @override
  final stateKey = 'config-state';

  IAppConfig? get config => _config.value;
  final StreamController<IAppConfig?> _configStreamController =
      StreamController();

  @override
  Future<void> init() async {
    _config.addListener(() {
      _configStreamController.add(_config.value);
    });
    await super.init();
  }

  @override
  Future<void> restore() async {
    await super.restore();
    if (_config.value == null) {
      _config.value = defaultConfig;
    }
  }

  void addConfigChangeListener(Function(IAppConfig?) onChanged) =>
      _configStreamController.stream.listen(onChanged);

  Future<void> setConfig(IAppConfig config) async {
    _config.value = config;
    // сохраняем конфигурацию в хранилище
    await save();
  }

  @override
  void fromJson(Map<String, dynamic> jsonMap) {
    final appEnvironment = jsonMap['appEnvironment'];
    _config.value =
        configs.firstWhereOrNull((c) => c.environment.key == appEnvironment) ??
            defaultConfig;
  }

  @override
  Map<String, dynamic> toJson() => {
        'appEnvironment': _config.value?.environment.key,
      };
}
