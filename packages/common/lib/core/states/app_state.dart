import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info/package_info.dart';
import 'package:rx_notifier/rx_notifier.dart';

/// Состояние приложения
/// Хранит общие данные приложения
/// Не включает логику (только хранение данных)
abstract class IAppState {
  // Информация о версии приложения
  final packageInfo = RxNotifier<PackageInfo?>(null);
  // Информация об устройстве
  final deviceData = RxNotifier<Map<String, dynamic>?>(null);
  final deviceManufacturer = RxNotifier<String?>(null);
  final deviceModel = RxNotifier<String?>(null);

  String? get appVersion => packageInfo.value?.version;

  String? get appBuildVersion => packageInfo.value?.buildNumber;

  String? get packageName => packageInfo.value?.packageName;

  String get appOs;

  String? get appId;

  // Инициализируем состояние
  // (восстанавливаем ранее сохраненные данные, например после закрытия приложения)
  Future<void> init() async {
    await restorePackageInfo();
    await restoreDeviceInfo();
  }

  Future<void> restorePackageInfo() async {
    packageInfo.value = await PackageInfo.fromPlatform();
  }

  Future<void> restoreDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    deviceData.value = deviceInfo.data;

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      deviceManufacturer.value = androidInfo.manufacturer;
      deviceModel.value = androidInfo.model;
    } else if (Platform.isIOS) {
      deviceManufacturer.value = 'Apple';
    }
  }
}
