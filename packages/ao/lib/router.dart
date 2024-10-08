import 'package:ao/features/ao_main_page/ao_main_page.dart';
import 'package:auto_route/auto_route.dart';

part 'router.gm.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Page,PageRoute')
class AoRouter extends _$AoRouter {}

List<AutoRoute> get aoRoutes => [
      CupertinoRoute(
        page: AoMainPageRouteRoot.page,
        path: AoMainPageRoot.routeName,
        children: [
          CupertinoRoute(
            initial: true,
            path: AoMainPage.routeName,
            page: AoMainPageRoute.page,
          ),
        ],
      )
    ];
