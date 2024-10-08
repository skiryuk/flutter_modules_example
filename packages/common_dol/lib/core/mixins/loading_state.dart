import 'package:rx_notifier/rx_notifier.dart';

mixin LoadingState {
  final isLoading = RxNotifier<bool>(false);
}
