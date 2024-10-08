import 'package:auto_route/auto_route.dart';
import 'package:contracts/features/contracts_main_page/contracts_main_page.dart';

part 'router.gm.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Page,PageRoute')
class ContractsRouter extends _$ContractsRouter {}

List<AutoRoute> get contractsRoutes => [
      CupertinoRoute(
        page: ContractsMainPageRouteRoot.page,
        path: ContractsMainPageRoot.routeName,
        children: [
          CupertinoRoute(
            initial: true,
            path: ContractsMainPage.routeName,
            page: ContractsMainPageRoute.page,
          ),
        ],
      )
    ];
