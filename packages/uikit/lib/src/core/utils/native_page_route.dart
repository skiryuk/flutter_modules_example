import 'package:flutter/cupertino.dart';

/// Убирается тень на экране при переходе назад через CupertinoPageRoute

class NativePageRoute extends CupertinoPageRoute {
  NativePageRoute({
    required super.builder,
    super.settings,
  });

  @override
  Color? get barrierColor => null;
}
