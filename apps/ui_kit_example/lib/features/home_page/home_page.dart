import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import 'features/back_page_scaffold/back_page_scaffold.dart';
import 'features/module_page_scaffold/module_page_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xfff0f0f1),
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Компоненты',
                style: TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        NativePageRoute(
                          builder: (BuildContext context) =>
                              const BackPageScaffold(),
                        ),
                      ),
                      child: UiCard(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 32.h),
                          child: const Text(
                            'Back Page Scaffold',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: CupertinoColors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        NativePageRoute(
                          builder: (BuildContext context) =>
                              const ModulePageScaffold(),
                        ),
                      ),
                      child: UiCard(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 32.h),
                          child: const Text(
                            'Module Scaffold',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: CupertinoColors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
