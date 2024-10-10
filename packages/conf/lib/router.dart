import 'package:auto_route/auto_route.dart';
import 'package:conf/features/conf_detail_page/conf_detail_page.dart';
import 'package:conf/features/conf_main_page/conf_main_page.dart';

part 'router.gm.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Page,PageRoute')
class ConfRouter extends _$ConfRouter {}

List<AutoRoute> get confRoutes => [
      CupertinoRoute(
        page: ConfMainPageRouteRoot.page,
        path: ConfMainPageRoot.routeName,
        initial: true,
        children: [
          CupertinoRoute(
            initial: true,
            path: ConfMainPage.routeName,
            page: ConfMainPageRoute.page,
          ),
          CupertinoRoute(
            path: ConfDetailPage.routeName,
            page: ConfDetailPageRoute.page,
          ),
        ],
      )
    ];
