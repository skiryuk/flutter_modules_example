// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$ConfRouter extends AutoRouterModule {
  @override
  final Map<String, PageFactory> pagesMap = {
    ConfDetailPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ConfDetailPage(),
      );
    },
    ConfMainPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ConfMainPage(),
      );
    },
    ConfMainPageRouteRoot.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ConfMainPageRoot(),
      );
    },
  };
}

/// generated route for
/// [ConfDetailPage]
class ConfDetailPageRoute extends PageRouteInfo<void> {
  const ConfDetailPageRoute({List<PageRouteInfo>? children})
      : super(
          ConfDetailPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfDetailPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ConfMainPage]
class ConfMainPageRoute extends PageRouteInfo<void> {
  const ConfMainPageRoute({List<PageRouteInfo>? children})
      : super(
          ConfMainPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfMainPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ConfMainPageRoot]
class ConfMainPageRouteRoot extends PageRouteInfo<void> {
  const ConfMainPageRouteRoot({List<PageRouteInfo>? children})
      : super(
          ConfMainPageRouteRoot.name,
          initialChildren: children,
        );

  static const String name = 'ConfMainPageRouteRoot';

  static const PageInfo<void> page = PageInfo<void>(name);
}
