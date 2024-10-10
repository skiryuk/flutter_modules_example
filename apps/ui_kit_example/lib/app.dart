import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import 'features/home_page/home_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    if (!DeviceDimensions.isTablet) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    return MediaQuery.withNoTextScaling(
      child: ScreenUtilInit(
        designSize: DeviceDimensions.isTablet
            ? MediaQuery.of(context).orientation == Orientation.portrait
                ? const Size(768, 1024)
                : const Size(1024, 768)
            : const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) => const CupertinoApp(
          home: HomePage(),
          localizationsDelegates: [DefaultMaterialLocalizations.delegate],
        ),
      ),
    );
  }
}
