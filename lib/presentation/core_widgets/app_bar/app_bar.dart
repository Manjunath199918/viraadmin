import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? centerTitle;
  final Color? themeColor;

  const KAppBar({
    Key? key,
    this.bottom,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.title,
    this.leading,
    this.actions,
    this.centerTitle,
    this.themeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    return AppBar(
      // shape:  RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(8.toAutoScaledWidth),
      //   //  bottomRight: Radius.circular(-20.toAutoScaledWidth),
      //     topRight: Radius.circular(8.toAutoScaledWidth),
      //   ),
      // ),
      iconTheme: IconThemeData(
          color: themeColor?? currentTheme.themeBox.colors.white
      ),
      backgroundColor: backgroundColor ?? currentTheme.themeBox.colors.primary,
      elevation: elevation ?? 0,
      title: title,
      centerTitle: centerTitle,
      leading: leading,
      actions: actions,
      foregroundColor: foregroundColor ?? currentTheme.themeBox.colors.black,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(52.toAutoScaledHeight + (bottom?.preferredSize.height ?? 0.0));
}
