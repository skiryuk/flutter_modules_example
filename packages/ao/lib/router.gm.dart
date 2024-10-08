// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AoRouter extends AutoRouterModule {
  @override
  final Map<String, PageFactory> pagesMap = {
    AoMainPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AoMainPage(),
      );
    },
    AoMainPageRouteRoot.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AoMainPageRoot(),
      );
    },
  };
}

/// generated route for
/// [AoMainPage]
class AoMainPageRoute extends PageRouteInfo<void> {
  const AoMainPageRoute({List<PageRouteInfo>? children})
      : super(
          AoMainPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'AoMainPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AoMainPageRoot]
class AoMainPageRouteRoot extends PageRouteInfo<void> {
  const AoMainPageRouteRoot({List<PageRouteInfo>? children})
      : super(
          AoMainPageRouteRoot.name,
          initialChildren: children,
        );

  static const String name = 'AoMainPageRouteRoot';

  static const PageInfo<void> page = PageInfo<void>(name);
}
