import 'package:auto_route/auto_route.dart';
import 'package:dol/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:uikit/uikit.dart';

@RoutePage()
class ConfModulePage extends StatelessWidget {
  static const routeName = 'conf-module-page';

  const ConfModulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        bottom: false,
        child: UiModuleScaffold(
          body: const AutoRouter(),
          onBack: () =>
              context.router.popUntilRouteWithName(MainPageRoute.name),
        ),
      ),
    );
  }
}
