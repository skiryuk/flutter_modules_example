import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

@RoutePage()
class ContractsMainPageRoot extends AutoRouter {
  static const routeName = 'contracts-main-page-root';

  const ContractsMainPageRoot({super.key});
}

@RoutePage()
class ContractsMainPage extends StatefulWidget {
  static const routeName = 'contracts-main-page';

  const ContractsMainPage({super.key});

  @override
  State<ContractsMainPage> createState() => _ContractsMainPageState();
}

class _ContractsMainPageState extends State<ContractsMainPage> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      backgroundColor: Color(0xfff0f0f1),
      child: SafeArea(
        child: Text('This is CONTRACTS Page'),
      ),
    );
  }
}
