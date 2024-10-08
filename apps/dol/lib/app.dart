import 'package:common/core/framework/view_binding.dart';
import 'package:common/core/framework/view_widget.dart';
import 'package:dol/core/locale/ru_cupertino_localization.dart';
import 'package:dol/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:uikit/uikit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_bindings.dart';
import 'app_controller.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({
    Key? key,
  }) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final appRouter = GetIt.I.get<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return const App();
  }
}

class App extends ViewWidget {
  const App({Key? key}) : super(key: key);

  @override
  ViewWidgetState createState() => _AppState();

  @override
  ViewBindings createBindings() => AppBindings();
}

class _AppState extends ViewWidgetState<App, AppController> {
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
          builder: (innerContext, child) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  FocusManager.instance.primaryFocus!.unfocus();
                }
              },
              child: CupertinoApp.router(
                routerConfig: controller.appRouter.config(
                  navigatorObservers: () => [],
                ),
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  DefaultCupertinoLocalizations.delegate,
                  RuCupertimoLocalization.delegate,
                ],
                locale: const Locale('ru', 'RU'),
                supportedLocales: const [
                  Locale('ru', 'RU'),
                  Locale('en', 'EN')
                ],
                theme: const CupertinoThemeData(
                  brightness: Brightness.light,
                ),
              ),
            );
          }),
    );
  }
}
