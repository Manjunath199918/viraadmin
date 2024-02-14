part of '../router.dart';

abstract class KRouterObserver<TabRoute> {
  //TODO:should be of type KRouterObserver
  static final KRouterObserverImpl instance = KRouterObserverImpl();

  void didPush(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  );

  void didReplace({
    Route<dynamic>? newRoute,
    Route<dynamic>? oldRoute,
  });

  void didPop(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  );

  void didChangeTabRoute(
    TabRoute route,
    TabRoute previousRoute,
  );

  void didInitTabRoute(
    TabRoute route,
    TabRoute? previousRoute,
  );
}
