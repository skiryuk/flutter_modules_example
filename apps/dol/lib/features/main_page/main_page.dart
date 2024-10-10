import 'package:auto_route/auto_route.dart';
import 'package:dol/router.dart';
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
        bottom: false,
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
            ),
            Container(
              color: const Color(0xfff0f0f1),
              height: 32.h,
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
                child: ModuleTile(
                  title: 'CONTRACTS\nMODULE',
                  onTap: () {
                    context.pushRoute(const ContractsModulePageRoute());
                  },
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: ModuleTile(
                  title: 'AO\nMODULE',
                  onTap: () {
                    context.pushRoute(const AoModulePageRoute());
                  },
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16.h),
            child: Row(
              children: [
                Expanded(
                  child: ModuleTile(
                    title: 'CONF\nMODULE',
                    onTap: () {
                      context.pushRoute(const ConfModulePageRoute());
                    },
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

class ModuleTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const ModuleTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: UiCard(
        child: SizedBox(
          height: 128.h,
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
