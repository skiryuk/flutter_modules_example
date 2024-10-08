import 'dart:convert';

import 'package:common/core/storage/local_storage.dart';
import 'package:rx_notifier/rx_notifier.dart';

/// Вспомогательный класс для восстановления данных
/// из локального хранилища
abstract class HydratedState {
  final ILocalStorage _localStorage;
  final bool isAutoInit;

  abstract final String stateKey;

  HydratedState(this._localStorage, {this.isAutoInit = true}) {
    if (isAutoInit) {
      init();
    }
  }

  final inited = RxNotifier<bool>(false);

  // Автоматически восстановить ранее сохраненные данные
  Future<void> init() async {
    await restore();
    inited.value = true;
  }

  // Записать данные (храниться в виде JSON)
  Future<void> save() async {
    final Map<String, dynamic> jsonMap = toJson();
    await _localStorage.put(stateKey, json.encode(jsonMap));
  }

  // Восстановить ранее сохраненные данные
  Future<void> restore() async {
    final jsonString = await _localStorage.get(stateKey);
    if (jsonString != null) {
      fromJson(json.decode(jsonString));
    }
  }

  Map<String, dynamic> toJson();
  void fromJson(Map<String, dynamic> jsonMap);
}
