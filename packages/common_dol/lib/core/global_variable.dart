import 'package:auto_route/auto_route.dart';

TabsRouter? proMainPageTabs;

enum TabsIndex {
  main(0),
  cpu(1),
  conf(2),
  reports(3),
  news(4),
  profile(5),
  incident(6),
  sdo(7);

  final int value;
  const TabsIndex(this.value);
}
