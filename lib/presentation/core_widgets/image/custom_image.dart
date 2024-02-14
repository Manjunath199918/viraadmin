import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KImage extends ConsumerWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  final String? imageUrl;
  final Color? backgroundColor;
  final double? elevation;
  final double? radius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double? topLeft;
  final double? topRight;
  final double? bottomLeft;
  final double? bottomRight;
  final List<Widget>? stackWidgets;

  const KImage({
    Key? key,
   required this.imageUrl,
    this.bottom,
    this.backgroundColor,
    this.elevation,
    this.radius,
    required this.width,
    required this.height,
    this.padding,
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
    this.stackWidgets,

  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);
    return Padding(
      padding: padding ?? EdgeInsets.all(0.0),
      child: Container(
        height: height,
        width: width,

        decoration: BoxDecoration(
            color:backgroundColor??Colors.transparent,
            image: DecorationImage(
              image: AssetImage(
                  imageUrl!),
              fit: BoxFit.fill,
            )),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      52.toAutoScaledHeight + (bottom?.preferredSize.height ?? 0.0));
}
