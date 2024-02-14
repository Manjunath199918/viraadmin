part of '../../router.dart';

class KRouteTransitionBuilders {
  static const RouteTransitionsBuilder none = _none;

  static Widget _none(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }

  static const RouteTransitionsBuilder slideBottom = _slideBottom;

  static Widget _slideBottom(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          curve: Cubic(0.06, 1.05, 1, 1),
          parent: animation,
        ),
      ),
      child: child,
    );
  }
}
