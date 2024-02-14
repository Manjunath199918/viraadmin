import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KLine extends ConsumerWidget {
  const KLine();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);
    return Container(
        width: 360.toAutoScaledWidth,
        height: 1.toAutoScaledHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/profile/line.png'),
            fit: BoxFit.fitWidth,
          ),
          shape: BoxShape.rectangle,
        ));
  }
}
