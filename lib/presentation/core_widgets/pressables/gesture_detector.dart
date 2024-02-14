import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KGestureDetector extends ConsumerWidget {
  final VoidCallback? onTap;
  final bool hapticFeedbackEnabled;
  final Widget child;
  final HitTestBehavior? behavior;
  final bool disabled;
  final VoidCallback? onDisabledTapCallback;
  final EdgeInsets? padding;
  const KGestureDetector({
    Key? key,
    this.onTap,
    required this.child,
    this.hapticFeedbackEnabled = true,
    this.behavior,
    this.disabled = false,
    this.onDisabledTapCallback,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        if (disabled) {
          onDisabledTapCallback?.call();
          return;
        }

        if (onTap != null) {
          if (hapticFeedbackEnabled) {
            KAppX.services.haptics.hapticLight();

            Feedback.forTap(context);
          }

          onTap?.call();
        }
      },
      behavior: behavior,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
