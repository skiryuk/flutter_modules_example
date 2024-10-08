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
    return const CupertinoPageScaffold(
      backgroundColor: Color(0xfff0f0f1),
      child: SafeArea(
        child: Text('This is AO Page'),
      ),
    );
  }
}
