import 'package:ao/features/ao_detail_page/ao_detail_bindings.dart';
import 'package:ao/features/ao_detail_page/ao_detail_controller.dart';
import 'package:auto_route/auto_route.dart';
import 'package:common/core/framework/extensions/view_auto_route_widget.dart';
import 'package:common/core/framework/view_binding.dart';
import 'package:flutter/cupertino.dart';
import 'package:uikit/uikit.dart';

@RoutePage()
class AoDetailPage extends ViewAutoRouteWidget {
  static const routeName = 'ao-detail-page/:id';

  final String id;

  const AoDetailPage({
    super.key,
    super.bindings,
    super.parentBindings,
    @PathParam('id') required this.id,
  });

  @override
  ViewAutoRouteWidgetState createState() => _AoDetailPageState();

  @override
  ViewBindings createBindings() => AoDetailBindings();
}

class _AoDetailPageState
    extends ViewAutoRouteWidgetState<AoDetailPage, AoDetailController> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xfff0f0f1),
      child: SafeArea(
        bottom: false,
        child: UiBackPageScaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('This is details AO'),
              Text('First variant: ${widget.id}'),
              Text('Second variant: ${controller.id}'),
            ],
          ),
          onBack: context.router.back,
        ),
      ),
    );
  }
}
