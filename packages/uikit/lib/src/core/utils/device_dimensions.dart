import 'package:universal_io/io.dart';

import 'package:flutter/cupertino.dart';

class DeviceDimensions {
  static const double smallHeight = 667;
  static const double smallWidth = 375;

  static MediaQueryData get _queryData =>
      MediaQueryData.fromWindow(WidgetsBinding.instance.window);

  static bool get isSmallHeight => _queryData.size.height < smallHeight;

  static bool get isSmallWidth => _queryData.size.width < smallWidth;

  static bool get isSmall => isSmallWidth && isSmallHeight;

  static bool get isVertical => _queryData.size.height > _queryData.size.width;

  static bool get isPhoneXAndHigher =>
      Platform.isIOS && (_queryData.size.height >= 812.0);

  static bool get isPhoneX =>
      Platform.isIOS && (_queryData.size.height == 812.0);

  static bool get isTablet => _queryData.size.shortestSide >= 600;
}
