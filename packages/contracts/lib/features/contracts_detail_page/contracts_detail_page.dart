import 'package:auto_route/auto_route.dart';
import 'package:common/core/framework/extensions/view_auto_route_widget.dart';
import 'package:common/core/framework/view_binding.dart';
import 'package:contracts/features/contracts_detail_page/contracts_detail_bindings.dart';
import 'package:contracts/features/contracts_detail_page/contracts_detail_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:uikit/uikit.dart';

@RoutePage()
class ContractsDetailPage extends ViewAutoRouteWidget {
  static const routeName = 'contracts-detail-page';

  const ContractsDetailPage({super.key});

  @override
  ViewAutoRouteWidgetState createState() => _ContractsDetailPageState();

  @override
  ViewBindings createBindings() => ContractsDetailBindings();
}

class _ContractsDetailPageState extends ViewAutoRouteWidgetState<
    ContractsDetailPage, ContractsDetailController> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xfff0f0f1),
      child: SafeArea(
        bottom: false,
        child: UiBackPageScaffold(
          body: RxBuilder(
            builder: (_) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('This is details CONTRACTS'),
                SizedBox(
                  height: 16.h,
                ),
                if (controller.simNumber?.isNotEmpty ?? false)
                  Text('Номер SIM карты: ${controller.simNumber!}'),
                SizedBox(
                  height: 16.h,
                ),
                CupertinoTextField(
                  maxLength: 10,
                  prefix: const Text('  +7'),
                  placeholder: 'Номер телефона',
                  onChanged: (String? value) => controller.phone = value,
                ),
                SizedBox(
                  height: 16.h,
                ),
                if (controller.appVersion?.isNotEmpty ?? false)
                  Text('Версия приложения: ${controller.appVersion!}'),
              ],
            ),
          ),
          onBack: context.router.back,
        ),
      ),
    );
  }
}
