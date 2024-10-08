import 'dart:io';

import 'package:common/core/states/app_state.dart';
import 'package:common/core/storage/local_storage.dart';

class AppState extends IAppState {
  final ILocalStorage _localStorage;

  @override
  String get appOs =>
      (Platform.isAndroid ? 'Android' : 'iOS') +
      (deviceData.value != null
          ? Platform.isAndroid
              ? ', ${deviceData.value!['version']}'
              : ', ${deviceData.value!['systemVersion']}'
          : '');

  @override
  String? get appId => Platform.isIOS ? '111111111' : packageName;

  AppState(this._localStorage);
}
