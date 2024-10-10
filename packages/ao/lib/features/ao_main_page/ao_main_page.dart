import 'package:ao/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

@RoutePage()
class AoMainPageRoot extends AutoRouter {
  static const routeName = 'ao-main-page-root';

  const AoMainPageRoot({super.key});
}

@RoutePage()
class AoMainPage extends StatefulWidget {
  static const routeName = 'ao-main-page';

  const AoMainPage({super.key});

  @override
  State<AoMainPage> createState() => _AoMainPageState();
}

class _AoMainPageState extends State<AoMainPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xfff0f0f1),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('This is AO Page'),
            CupertinoButton(
                child: const Text('to Details'),
                onPressed: () {
                  context.router.push(const AoDetailPageRoute());
                })
          ],
        ),
      ),
    );
  }
}
