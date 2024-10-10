// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AoModulePageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AoModulePage(),
      );
    },
    ConfModulePageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ConfModulePage(),
      );
    },
    ContractsModulePageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ContractsModulePage(),
      );
    },
    MainPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    MainPageRouteHolder.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPageHolder(),
      );
    },
    SplashPageRoute.name: (routeData) {
      final args = routeData.argsAs<SplashPageRouteArgs>(
          orElse: () => const SplashPageRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SplashPage(
          key: args.key,
          bindings: args.bindings,
        ),
      );
    },
    ...AoRouter().pagesMap,
    ...ConfRouter().pagesMap,
    ...ContractsRouter().pagesMap,
  };
}

/// generated route for
/// [AoModulePage]
class AoModulePageRoute extends PageRouteInfo<void> {
  const AoModulePageRoute({List<PageRouteInfo>? children})
      : super(
          AoModulePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'AoModulePageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ConfModulePage]
class ConfModulePageRoute extends PageRouteInfo<void> {
  const ConfModulePageRoute({List<PageRouteInfo>? children})
      : super(
          ConfModulePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfModulePageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ContractsModulePage]
class ContractsModulePageRoute extends PageRouteInfo<void> {
  const ContractsModulePageRoute({List<PageRouteInfo>? children})
      : super(
          ContractsModulePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContractsModulePageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainPageRoute extends PageRouteInfo<void> {
  const MainPageRoute({List<PageRouteInfo>? children})
      : super(
          MainPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPageHolder]
class MainPageRouteHolder extends PageRouteInfo<void> {
  const MainPageRouteHolder({List<PageRouteInfo>? children})
      : super(
          MainPageRouteHolder.name,
          initialChildren: children,
        );

  static const String name = 'MainPageRouteHolder';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashPageRoute extends PageRouteInfo<SplashPageRouteArgs> {
  SplashPageRoute({
    Key? key,
    ViewBindings? bindings,
    List<PageRouteInfo>? children,
  }) : super(
          SplashPageRoute.name,
          args: SplashPageRouteArgs(
            key: key,
            bindings: bindings,
          ),
          initialChildren: children,
        );

  static const String name = 'SplashPageRoute';

  static const PageInfo<SplashPageRouteArgs> page =
      PageInfo<SplashPageRouteArgs>(name);
}

class SplashPageRouteArgs {
  const SplashPageRouteArgs({
    this.key,
    this.bindings,
  });

  final Key? key;

  final ViewBindings? bindings;

  @override
  String toString() {
    return 'SplashPageRouteArgs{key: $key, bindings: $bindings}';
  }
}
