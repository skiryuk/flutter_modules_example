import 'package:auto_route/auto_route.dart';
import 'package:common/core/framework/view_binding.dart';
import 'package:contracts/contracts_bindings.dart';
import 'package:contracts/contracts_controller.dart';
import 'package:contracts/features/contracts_main_page/contracts_main_bindings.dart';
import 'package:contracts/features/contracts_main_page/contracts_main_controller.dart';
import 'package:contracts/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:common/core/framework/extensions/view_auto_route_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ContractsMainPageRoot extends ViewAutoRouteWidget {
  static const routeName = 'contracts-main-page-root';

  const ContractsMainPageRoot({super.key});

  @override
  ViewAutoRouteWidgetState createState() => _ContractsMainPageRootState();

  @override
  ViewBindings createBindings() => ContractsBindings();
}

class _ContractsMainPageRootState extends ViewAutoRouteWidgetState<
    ContractsMainPageRoot, ContractsController> {
  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

@RoutePage()
class ContractsMainPage extends ViewAutoRouteWidget {
  static const routeName = 'contracts-main-page';

  const ContractsMainPage({super.key});

  @override
  ViewAutoRouteWidgetState createState() => _ContractsMainPageState();

  @override
  ViewBindings createBindings() => ContractsMainBindings();
}

class _ContractsMainPageState extends ViewAutoRouteWidgetState<
    ContractsMainPage, ContractsMainController> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xfff0f0f1),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('This is CONTRACTS Page'),
            SizedBox(
              height: 16.h,
            ),
            CupertinoTextField(
              maxLength: 18,
              placeholder: 'Номер SIM карты',
              onChanged: (String? value) => controller.simNumber = value,
            ),
            SizedBox(
              height: 16.h,
            ),
            CupertinoButton(
                child: const Text('to Details'),
                onPressed: () {
                  context.router.push(const ContractsDetailPageRoute());
                })
          ],
        ),
      ),
    );
  }
}
