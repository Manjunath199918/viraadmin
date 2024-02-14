part of '../../app_extension.dart';

class KDialogs {
  KDialogs._();

  Future<void> openGeneralDialog({
    required Widget Function(BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation)
        body,
    bool barrierDismissible = false,
    String? barrierLabel,
    Color barrierColor = const Color.fromRGBO(0, 0, 0, 0.25),
    Duration transitionDuration = const Duration(milliseconds: 200),
    Widget Function(BuildContext, Animation, Animation, Widget)?
        transitionBuilder,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
  }) {
    Future<void> dialog = showGeneralDialog(
      context: KAppX.currentContext!,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      barrierColor: barrierColor,
      transitionDuration: transitionDuration,
      transitionBuilder: transitionBuilder,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      anchorPoint: anchorPoint,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Material(
          color: Colors.transparent,
          child: Align(
            alignment: Alignment.center,
            child: body(context, animation, secondaryAnimation),
          ),
        );
      },
    );

    return dialog;
  }

  Future<void> openDialog({
    required Widget Function(BuildContext context) body,
    bool barrierDismissible = true,
    String? barrierLabel,
    Color barrierColor = const Color.fromRGBO(0, 0, 0, 0.25),
    Widget Function(BuildContext, Animation, Animation, Widget)?
        transitionBuilder,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    //
    Color? backgroundColor,
    double? elevation,
    Duration insetAnimationDuration = const Duration(milliseconds: 100),
    Curve insetAnimationCurve = Curves.decelerate,
    EdgeInsets? insetPadding,
    Clip clipBehavior = Clip.none,
    ShapeBorder? shape,
    AlignmentGeometry? alignment,
  }) {
    final currentTheme = KAppX.globalProvider.read(KAppX.theme.current);

    Future<void> dialog = showDialog(
      context: KAppX.currentContext!,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      barrierColor: barrierColor,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      anchorPoint: anchorPoint,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor:
              backgroundColor ?? currentTheme.themeBox.colors.background,
          elevation: elevation,
          insetAnimationDuration: insetAnimationDuration,
          insetAnimationCurve: insetAnimationCurve,
          insetPadding: insetPadding,
          clipBehavior: clipBehavior,
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.toAutoScaledWidth),
                ),
              ),
          alignment: alignment,
          child: body(context),
        );
      },
    );

    return dialog;
  }
}
