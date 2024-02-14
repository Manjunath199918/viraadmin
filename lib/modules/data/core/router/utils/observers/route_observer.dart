part of '../../router.dart';

//TODO: remove KRouterObserver if observers function not working
class KRouterObserverImpl extends AutoRouteObserver implements KRouterObserver<TabPageRoute> {
  @override
  void didPush(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) {}

  @override
  void didReplace({
    Route<dynamic>? newRoute,
    Route<dynamic>? oldRoute,
  }) {}

  @override
  void didPop(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) {}

  @override
  void didChangeTabRoute(
    TabPageRoute route,
    TabPageRoute previousRoute,
  ) {}

  @override
  void didInitTabRoute(
    TabPageRoute route,
    TabPageRoute? previousRoute,
  ) {}
}
