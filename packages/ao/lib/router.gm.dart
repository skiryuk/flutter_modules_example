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
    AoDetailPageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<AoDetailPageRouteArgs>(
          orElse: () => AoDetailPageRouteArgs(id: pathParams.getString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AoDetailPage(
          key: args.key,
          bindings: args.bindings,
          parentBindings: args.parentBindings,
          id: args.id,
        ),
      );
    },
    AoMainPageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<AoMainPageRouteArgs>(
          orElse: () => AoMainPageRouteArgs(id: pathParams.optString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AoMainPage(
          key: args.key,
          id: args.id,
        ),
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
/// [AoDetailPage]
class AoDetailPageRoute extends PageRouteInfo<AoDetailPageRouteArgs> {
  AoDetailPageRoute({
    Key? key,
    ViewBindings? bindings,
    ViewBindings? parentBindings,
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
          AoDetailPageRoute.name,
          args: AoDetailPageRouteArgs(
            key: key,
            bindings: bindings,
            parentBindings: parentBindings,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'AoDetailPageRoute';

  static const PageInfo<AoDetailPageRouteArgs> page =
      PageInfo<AoDetailPageRouteArgs>(name);
}

class AoDetailPageRouteArgs {
  const AoDetailPageRouteArgs({
    this.key,
    this.bindings,
    this.parentBindings,
    required this.id,
  });

  final Key? key;

  final ViewBindings? bindings;

  final ViewBindings? parentBindings;

  final String id;

  @override
  String toString() {
    return 'AoDetailPageRouteArgs{key: $key, bindings: $bindings, parentBindings: $parentBindings, id: $id}';
  }
}

/// generated route for
/// [AoMainPage]
class AoMainPageRoute extends PageRouteInfo<AoMainPageRouteArgs> {
  AoMainPageRoute({
    Key? key,
    required String? id,
    List<PageRouteInfo>? children,
  }) : super(
          AoMainPageRoute.name,
          args: AoMainPageRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'AoMainPageRoute';

  static const PageInfo<AoMainPageRouteArgs> page =
      PageInfo<AoMainPageRouteArgs>(name);
}

class AoMainPageRouteArgs {
  const AoMainPageRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final String? id;

  @override
  String toString() {
    return 'AoMainPageRouteArgs{key: $key, id: $id}';
  }
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
