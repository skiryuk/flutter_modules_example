import 'package:auto_route/auto_route.dart';
import 'package:common/core/framework/view_binding.dart';
import 'package:conf/router.dart';
import 'package:ao/router.dart';
import 'package:contracts/router.dart';
import 'package:dol/features/main_page/main_page.dart';
import 'package:dol/features/splash_page/splash_page.dart';
import 'package:flutter/widgets.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,PageRoute',
  modules: [
    AoRouter,
    ConfRouter,
    ContractsRouter,
  ],
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        CupertinoRoute(
          path: Navigator.defaultRouteName,
          page: SplashPageRoute.page,
          initial: true,
        ),
        CupertinoRoute(
          path: MainPageHolder.routeName,
          page: MainPageRouteHolder.page,
          children: [
            CupertinoRoute(
              path: MainPage.routeName,
              page: MainPageRoute.page,
              initial: true,
            ),
            ...aoRoutes,
            ...confRoutes,
            ...contractsRoutes,
          ],
        ),
      ];
}
