import 'package:common/core/framework/view_controller.dart';
import 'package:dol/router.dart';
import 'package:rx_notifier/rx_notifier.dart';

class AppController extends ViewController {
  final AppRouter appRouter;

  AppController(
    this.appRouter,
  );

  late RxDisposer _disposer;
  final _appLoaded = RxNotifier<bool?>(null);

  void appLoadFinish() {
    _appLoaded.value = true;
  }

  @override
  void onReady() {
    _disposer = rxObserver(() {
      if (_appLoaded.value == true) {
        appRouter.replace(const MainPageRouteHolder());
      }
    });
  }

  @override
  void onDispose() {
    super.onDispose();
    _disposer();
  }
}
