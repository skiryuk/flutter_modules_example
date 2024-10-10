import 'dart:async';

import 'package:common_dol/core/services/log_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:common_dol/core/config/app_config.dart';

import 'app.dart';
import 'core/bindings/core_binding.dart';

// Подготовка к запуску основного приложения
void runner({AppConfig? appConfig}) async {
  WidgetsFlutterBinding.ensureInitialized();

  late LogService logService;

  // Подключаем минимально необходимые для запуска зависимости
  await CoreBinding(appConfig).dependencies();

  // Запускаем приложение в зоне
  logService = GetIt.I.get<LogService>();

  if (kReleaseMode) {
    FlutterError.onError =
        (FlutterErrorDetails error) => logService.logError(error);
  }

  await init();

  PlatformDispatcher.instance.onError = (Object error, StackTrace stackTrace) {
    GetIt.I.get<LogService>().logError(error, stackTrace);
    if (!kReleaseMode) {
      print(error);
      print(stackTrace);
    }
    return true;
  };
}

// Инициализация запуска основного приложения
Future<void> init() async {
  // Всегда использовать светлую тему
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.light));
  runApp(const AppWidget());
}
