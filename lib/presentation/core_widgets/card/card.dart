import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KCard extends ConsumerWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final double? elevation;
  final double? radius;
  final double? width;
  final double? height;
  final double? paddingLeft;
  final double? paddingTop;
  final double? paddingRight;
  final double? paddingBottom;
  final double? topLeft;
  final double? topRight;
  final double? bottomLeft;
  final double? bottomRight;
  final String? imageUrl;

  final List<BoxShadow>? boxShadow;
  final Clip? clip;
  final Widget? child;

  const KCard({
    Key? key,
    this.bottom,
    this.backgroundColor,
    this.elevation,
    this.radius,
    this.width,
    this.height,
    this.paddingLeft,
    this.paddingBottom,
    this.paddingRight,
    this.paddingTop,
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
    this.child,
    this.imageUrl,
    this.boxShadow,
    this.clip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);
    Decoration decoration = imageUrl != null
        ? BoxDecoration(
            // color: currentTheme.themeBox.colors.blankButton.withOpacity(0.04),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeft ?? 12.toAutoScaledWidth),
              topRight: Radius.circular(topRight ?? 12.toAutoScaledWidth),
              bottomLeft: Radius.circular(bottomLeft ?? 12.toAutoScaledWidth),
              bottomRight: Radius.circular(bottomRight ?? 12.toAutoScaledWidth),
            ),
            image: DecorationImage(
              image: AssetImage(imageUrl!),
              fit: BoxFit.fill,
            ),
            boxShadow:boxShadow,
            color: backgroundColor ?? currentTheme.themeBox.colors.white)
        : BoxDecoration(
            // color: currentTheme.themeBox.colors.blankButton.withOpacity(0.04),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeft ?? 12.toAutoScaledWidth),
              topRight: Radius.circular(topRight ?? 12.toAutoScaledWidth),
              bottomLeft: Radius.circular(bottomLeft ?? 12.toAutoScaledWidth),
              bottomRight: Radius.circular(bottomRight ?? 12.toAutoScaledWidth),
            ),
            color: backgroundColor ?? currentTheme.themeBox.colors.white,
            boxShadow: boxShadow
          );
    double Width = width ?? 322.toAutoScaledWidth;


    return Padding(
        padding: EdgeInsets.fromLTRB(
          paddingLeft ?? 20.toAutoScaledWidth,
          paddingTop ?? 20.toAutoScaledHeight,
          paddingRight ?? 20.toAutoScaledWidth,
          paddingBottom ?? 20.toAutoScaledHeight,
        ),
        child: height != null
            ? Container(
                height: height,
                width: Width,
                decoration: decoration,
                child: child)
            : Container(width: Width, decoration: decoration, child: child));
  }

  @override
  Size get preferredSize => Size.fromHeight(
      52.toAutoScaledHeight + (bottom?.preferredSize.height ?? 0.0));
}
