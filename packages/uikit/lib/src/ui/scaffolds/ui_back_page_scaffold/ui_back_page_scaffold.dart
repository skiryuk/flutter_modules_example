import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiBackPageScaffold extends StatelessWidget {
  final Widget body;
  final VoidCallback onBack;

  const UiBackPageScaffold({
    super.key,
    required this.body,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ModuleBackButton(onBack: onBack),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Expanded(
          child: body,
        ),
      ],
    );
  }
}

class ModuleBackButton extends StatelessWidget {
  final VoidCallback onBack;

  const ModuleBackButton({
    super.key,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBack,
      child: const Row(
        children: [
          Icon(
            Icons.arrow_back,
            size: 24,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            'Назад',
            style: TextStyle(color: CupertinoColors.activeBlue),
          )
        ],
      ),
    );
  }
}
