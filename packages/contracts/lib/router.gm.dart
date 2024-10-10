// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$ContractsRouter extends AutoRouterModule {
  @override
  final Map<String, PageFactory> pagesMap = {
    ContractsDetailPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ContractsDetailPage(),
      );
    },
    ContractsMainPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ContractsMainPage(),
      );
    },
    ContractsMainPageRouteRoot.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ContractsMainPageRoot(),
      );
    },
  };
}

/// generated route for
/// [ContractsDetailPage]
class ContractsDetailPageRoute extends PageRouteInfo<void> {
  const ContractsDetailPageRoute({List<PageRouteInfo>? children})
      : super(
          ContractsDetailPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContractsDetailPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ContractsMainPage]
class ContractsMainPageRoute extends PageRouteInfo<void> {
  const ContractsMainPageRoute({List<PageRouteInfo>? children})
      : super(
          ContractsMainPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContractsMainPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ContractsMainPageRoot]
class ContractsMainPageRouteRoot extends PageRouteInfo<void> {
  const ContractsMainPageRouteRoot({List<PageRouteInfo>? children})
      : super(
          ContractsMainPageRouteRoot.name,
          initialChildren: children,
        );

  static const String name = 'ContractsMainPageRouteRoot';

  static const PageInfo<void> page = PageInfo<void>(name);
}
