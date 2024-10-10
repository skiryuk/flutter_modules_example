import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'app.dart';

void main() {
  // Всегда использовать светлую тему
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.light));
  runApp(const App());
}
