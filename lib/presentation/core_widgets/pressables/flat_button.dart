import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/presentation/core_widgets/loaders/ciruclar_loader.dart';
import 'package:viraadmin/presentation/core_widgets/pressables/clickable.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KFlatButton extends ConsumerWidget {
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final bool disabled;
  final bool loading;
  final Widget child;
  final Color? color;
  final Border? borderStyle;
  final bool isPrimary;
  final Gradient? gradient;
  final Widget? loadingWidget;

  KFlatButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.borderRadius,
    this.width,
    this.height,
    this.padding,
    this.borderStyle,
    this.color,
    this.disabled = false,
    this.loading = false,
    this.isPrimary = true,
    this.gradient,
    this.loadingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    return KClickable(
      onPressed: () {
        if (!loading) {
          onPressed();
        }
      },
      disabled: disabled,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color ??
              () {
                late Color color;

                if (isPrimary) {
                  color = currentTheme.themeBox.colors.primary;
                } else {
                  color = currentTheme.themeBox.colors.secondary;
                }
                return color;
              }(),
          gradient: gradient,
          borderRadius:
              borderRadius ?? BorderRadius.circular(12.toAutoScaledWidth),
          border: borderStyle,
        ),
        child: Stack(
          children: [
            loading
                ? SizedBox()
                : Center(
                    child: Padding(
                      padding: padding ??
                          EdgeInsets.symmetric(
                            vertical: currentTheme.themeBox.paddings.v12,
                            horizontal: currentTheme.themeBox.paddings.h20,
                          ),
                      child: child,
                    ),
                  ),
            Center(
              child: loading
                  ? loadingWidget ??
                      SizedBox(
                        height: 30.toAutoScaledHeight,
                        width: 30.toAutoScaledWidth,
                        child: KCircularLoaderWhite(),
                      )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
