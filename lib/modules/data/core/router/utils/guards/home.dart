part of '../../router.dart';

//TODO:Remove KRouterGuard if guard not working
class HomeGuard extends AutoRouteGuard implements KRouterGuard<NavigationResolver, StackRouter> {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    //TODO: home middleware checks
    resolver.next(true);
  }
}
