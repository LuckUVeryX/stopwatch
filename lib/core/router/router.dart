import 'package:auto_route/auto_route.dart';

import '../../app/stopwatch/stopwatch_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: StopwatchPage, initial: true),
  ],
)
class $AppRouter {}
