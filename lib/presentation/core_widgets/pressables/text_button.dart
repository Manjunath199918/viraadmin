import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/presentation/core_widgets/loaders/ciruclar_loader.dart';
import 'package:viraadmin/presentation/core_widgets/pressables/clickable.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KTextButton extends ConsumerWidget {
  final VoidCallback? onPressed;
  final bool disabled;
  final bool loading;
  final Text text;
  final Widget? loadingWidget;
  final EdgeInsetsGeometry? padding;

  KTextButton({
    Key? key,
    this.onPressed,
    this.loading = false,
    this.disabled = false,
    required this.text,
    this.loadingWidget,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    late Widget widget;
    if (loading) {
      widget = (loadingWidget ??
          KCircularLoaderPrimary(
            scale: 1.toAutoScaledWidth,
          ));
    } else {
      widget = text;
    }

    return KClickable(
      onPressed: onPressed,
      disabled: disabled,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: widget,
      ),
    );
  }
}
