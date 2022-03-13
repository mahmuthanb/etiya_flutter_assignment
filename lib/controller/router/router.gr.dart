// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:etiya_flutter_assignment/view/detail_page.dart' as _i2;
import 'package:etiya_flutter_assignment/view/home_page.dart' as _i1;
import 'package:flutter/material.dart' as _i4;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    MovieDetailPageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MovieDetailPageRouteArgs>(
          orElse: () => MovieDetailPageRouteArgs(
              movieID: pathParams.getString('movieID')));
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.MovieDetailPage(movieID: args.movieID, key: args.key));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(HomePageRoute.name, path: '/'),
        _i3.RouteConfig(MovieDetailPageRoute.name,
            path: '/movie-detail/:movieID')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomePageRoute extends _i3.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i2.MovieDetailPage]
class MovieDetailPageRoute extends _i3.PageRouteInfo<MovieDetailPageRouteArgs> {
  MovieDetailPageRoute({required String movieID, _i4.Key? key})
      : super(MovieDetailPageRoute.name,
            path: '/movie-detail/:movieID',
            args: MovieDetailPageRouteArgs(movieID: movieID, key: key),
            rawPathParams: {'movieID': movieID});

  static const String name = 'MovieDetailPageRoute';
}

class MovieDetailPageRouteArgs {
  const MovieDetailPageRouteArgs({required this.movieID, this.key});

  final String movieID;

  final _i4.Key? key;

  @override
  String toString() {
    return 'MovieDetailPageRouteArgs{movieID: $movieID, key: $key}';
  }
}
