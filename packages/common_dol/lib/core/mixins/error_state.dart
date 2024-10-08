import 'package:rx_notifier/rx_notifier.dart';

mixin ErrorState {
  final errorMessage = RxNotifier<String?>(null);
}
