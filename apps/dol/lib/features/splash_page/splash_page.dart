import 'package:auto_route/auto_route.dart';
import 'package:common/core/framework/view_binding.dart';
import 'package:common/core/framework/view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'splash_page_binding.dart';
import 'splash_page_controller.dart';

@RoutePage()
class SplashPage extends ViewWidget {
  static const routeName = '/splash-page';

  const SplashPage({super.key, super.bindings});

  @override
  ViewWidgetState createState() => _SplashPageState();

  @override
  ViewBindings createBindings() => SplashPageBinding();
}

class _SplashPageState
    extends ViewWidgetState<SplashPage, SplashPageController> {
  bool _bootstrapped = false;

  @override
  void initState() {
    super.initState();
    _tryBootstrap();
  }

  Future<void> _tryBootstrap() async {
    try {
      await controller.bootstrap();
    } finally {
      await Future.delayed(const Duration(milliseconds: 200));
      setState(() {
        _bootstrapped = true;
      });
      // await Get.tryFind<ILocalStorage>().clearAll();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Spacer(),
                  CircularProgressIndicator(),
                  Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
