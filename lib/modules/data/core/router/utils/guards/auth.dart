part of '../../router.dart';

//TODO:Remove KRouterGuard if guard not working
class AuthGuard extends AutoRouteGuard implements KRouterGuard<NavigationResolver, StackRouter> {
  static Completer<void>? _onLogInSuccessful;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    //TODO: auth middleware checks
    resolver.next(true);
  }
}
