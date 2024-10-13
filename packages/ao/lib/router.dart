import 'package:ao/features/ao_detail_page/ao_detail_page.dart';
import 'package:ao/features/ao_main_page/ao_main_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:common/core/framework/view_binding.dart';
import 'package:flutter/foundation.dart';

part 'router.gm.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Page,PageRoute')
class AoRouter extends _$AoRouter {}

List<AutoRoute> get aoRoutes => [
      CupertinoRoute(
        page: AoMainPageRouteRoot.page,
        path: AoMainPageRoot.routeName,
        initial: true,
        children: [
          CupertinoRoute(
            initial: true,
            path: AoMainPage.routeName,
            page: AoMainPageRoute.page,
          ),
          CupertinoRoute(
            path: AoDetailPage.routeName,
            page: AoDetailPageRoute.page,
          ),
        ],
      )
    ];
