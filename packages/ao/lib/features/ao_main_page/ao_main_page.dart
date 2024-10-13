import 'package:ao/features/ao_main_page/ao_main_controller.dart';
import 'package:ao/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:common/core/framework/extensions/view_auto_route_widget.dart';
import 'package:common/core/framework/view_binding.dart';
import 'package:flutter/cupertino.dart';

import 'ao_main_bindings.dart';

@RoutePage()
class AoMainPageRoot extends AutoRouter {
  static const routeName = 'ao-main-page-root';

  const AoMainPageRoot({super.key});
}

@RoutePage()
class AoMainPage extends ViewAutoRouteWidget {
  static const routeName = 'ao-main-page/:id';

  final String? id;

  const AoMainPage({
    super.key,
    @PathParam('id') required this.id,
  });

  @override
  ViewAutoRouteWidgetState createState() => _AoMainPageState();

  @override
  ViewBindings createBindings() => AoMainBindings();
}

class _AoMainPageState
    extends ViewAutoRouteWidgetState<AoMainPage, AoMainController> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xfff0f0f1),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('This is AO Page'),
            Text('First variant: ${widget.id}'),
            Text('Second variant: ${controller.id}'),
            CupertinoButton(
                child: const Text('to Details'),
                onPressed: () {
                  context.router.push(AoDetailPageRoute(id: '123456789'));
                }),
          ],
        ),
      ),
    );
  }
}
