import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:uikit/uikit.dart';

@RoutePage()
class ConfDetailPage extends StatelessWidget {
  static const routeName = 'conf-detail-page';

  const ConfDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xfff0f0f1),
      child: SafeArea(
        bottom: false,
        child: UiBackPageScaffold(
          body: const Text('This is details CONF'),
          onBack: context.router.back,
        ),
      ),
    );
  }
}
