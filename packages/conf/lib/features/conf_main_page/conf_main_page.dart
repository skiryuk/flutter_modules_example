import 'package:auto_route/auto_route.dart';
import 'package:conf/router.dart';
import 'package:flutter/cupertino.dart';

@RoutePage()
class ConfMainPageRoot extends AutoRouter {
  static const routeName = 'conf-main-page-root';

  const ConfMainPageRoot({super.key});
}

@RoutePage()
class ConfMainPage extends StatefulWidget {
  static const routeName = 'conf-main-page';

  const ConfMainPage({super.key});

  @override
  State<ConfMainPage> createState() => _ConfMainPageState();
}

class _ConfMainPageState extends State<ConfMainPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xfff0f0f1),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('This is CONF Page'),
            CupertinoButton(
                child: const Text('to Details'),
                onPressed: () {
                  context.router.push(const ConfDetailPageRoute());
                })
          ],
        ),
      ),
    );
  }
}
