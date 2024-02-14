import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/modules/domain/core/theme/theme.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:viraadmin/utils/assets/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class KCircularLoader extends ConsumerWidget {
  final String animation;
  final double? width;
  final double? height;
  final double? scale;

  KCircularLoader(
    this.animation, {
    Key? key,
    this.width,
    this.height,
    this.scale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _height = height ?? 40.toAutoScaledHeight;
    final _width = width ?? 40.toAutoScaledWidth;
    final _scale = scale ?? 1.5.toAutoScaledWidth;

    return Transform.scale(
      scale: _scale,
      child: Lottie.asset(
        animation,
        height: _height,
        width: _width,
      ),
    );
  }
}

class KCircularLoaderPrimary extends ConsumerWidget {
  final double? width;
  final double? height;
  final double? scale;
  const KCircularLoaderPrimary({
    Key? key,
    this.width,
    this.height,
    this.scale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    final isDarkTheme = currentTheme.type == KThemeType.dark;

    final animation = isDarkTheme ? KAnimations.primaryLoaderDark : KAnimations.primaryLoaderLight;

    return KCircularLoader(
      animation,
      width: width,
      height: height,
      scale: scale,
    );
  }
}

class KCircularLoaderSecondary extends ConsumerWidget {
  final double? width;
  final double? height;
  final double? scale;
  const KCircularLoaderSecondary({
    Key? key,
    this.width,
    this.height,
    this.scale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    final isDarkTheme = currentTheme.type == KThemeType.dark;

    final animation = isDarkTheme ? KAnimations.primaryLoaderDark : KAnimations.primaryLoaderLight;

    return KCircularLoader(
      animation,
      width: width,
      height: height,
      scale: scale,
    );
  }
}

class KCircularLoaderWhite extends StatelessWidget {
  final double? width;
  final double? height;
  final double? scale;
  const KCircularLoaderWhite({
    Key? key,
    this.width,
    this.height,
    this.scale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KCircularLoader(
      KAnimations.whiteLoader,
      width: width,
      height: height,
      scale: scale,
    );
  }
}

class KCircularLoaderBlack extends StatelessWidget {
  final double? width;
  final double? height;
  final double? scale;
  const KCircularLoaderBlack({
    Key? key,
    this.width,
    this.height,
    this.scale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KCircularLoader(
      KAnimations.blackLoader,
      width: width,
      height: height,
      scale: scale,
    );
  }
}
