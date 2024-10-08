import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:uikit/uikit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class MainPageHolder extends AutoRouter {
  static const routeName = '/main-page-holder';

  const MainPageHolder({super.key});
}

@RoutePage()
class MainPage extends StatefulWidget {
  static const routeName = 'main-page';

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: SafeArea(
        child: Column(
          children: [
            const NewsWidget(),
            Expanded(
              child: Container(
                color: const Color(0xfff0f0f1),
                child: const Column(
                  children: [
                    Spacer(),
                    MenuWidget(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// Виджет с новостями
class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.white,
      height: 200,
      child: const Center(
        child: Text('NEWS'),
      ),
    );
  }
}

/// Виджет меню с кнопками в модули
class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: UiCard(
                  child: SizedBox(
                    height: 128.h,
                    child: const Center(
                      child: Text(
                        'CONTRACTS\nMODULE',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: UiCard(
                  child: SizedBox(
                    height: 128.h,
                    child: const Center(
                      child: Text(
                        'AO\nMODULE',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16.h),
            child: Row(
              children: [
                Expanded(
                  child: UiCard(
                    child: SizedBox(
                      height: 128.h,
                      child: const Center(
                        child: Text(
                          'CONF\nMODULE',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
