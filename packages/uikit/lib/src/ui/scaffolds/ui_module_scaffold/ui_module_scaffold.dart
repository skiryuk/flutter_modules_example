import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiModuleScaffold extends StatelessWidget {
  final Widget body;
  final VoidCallback onBack;

  const UiModuleScaffold({
    super.key,
    required this.body,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56.h,
          color: CupertinoColors.white,
          child: Row(
            children: [
              const Spacer(),
              ModuleCloseButton(onBack: onBack),
            ],
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              color: const Color(0xfff0f0f1),
              child: body,
            ),
          ),
        ),
      ],
    );
  }
}

class ModuleCloseButton extends StatelessWidget {
  final VoidCallback onBack;

  const ModuleCloseButton({
    super.key,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBack,
      child: SizedBox(
        width: 56.w,
        child: Container(
          width: 32,
          height: 32,
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xfff0f0f1),
          ),
          child: const Center(
            child: Icon(
              Icons.close_rounded,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
