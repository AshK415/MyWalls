import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mywalls/src/app/app.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final _key = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: kDebugMode,
    initialLocation: AppRoute.path,
    routes: $appRoutes,
  );
}

@TypedGoRoute<AppRoute>(path: AppRoute.path)
class AppRoute extends GoRouteData {
  const AppRoute();
  static const path = '/';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AppStartPage();
  }
}

class GoNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('did push route $route : $previousRoute');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('did pop route $route : $previousRoute');
  }
}
