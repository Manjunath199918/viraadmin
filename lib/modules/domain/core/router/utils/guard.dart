part of '../router.dart';

abstract class KRouterGuard<R, StackRouter> {
  void onNavigation(R resolver, StackRouter router);
}
