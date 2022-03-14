import 'package:auto_route/annotations.dart';
import 'package:etiya_flutter_assignment/view/detail_page.dart';
import 'package:etiya_flutter_assignment/view/home_page.dart';

@CupertinoAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: HomePage, initial: true),
  AutoRoute(page: MovieDetailPage, path: '/movie-detail/:movieID')
])
class $AppRouter {}
