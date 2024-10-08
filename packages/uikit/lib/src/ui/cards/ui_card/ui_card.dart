import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Стандартная карточка с тенью
class UiCard extends StatelessWidget {
  /// Виджет, который будет показан в карточке
  final Widget child;

  /// Радиус скругления карточки
  final double radius;

  UiCard({Key? key, required this.child, radius})
      : radius = radius ?? 12.r,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
                color: CupertinoColors.black.withOpacity(0.08),
                //   color: const Color(0x3DB6B7B9),
                offset: Offset(0, 2.r),
                blurRadius: 4.r,
                spreadRadius: 0),
          ]),
      child: child,
    );
  }
}
