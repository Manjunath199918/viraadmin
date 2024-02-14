import 'package:viraadmin/modules/data/core/theme/theme.dart';
import 'package:viraadmin/modules/domain/core/theme/theme.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:flutter/material.dart';

part 'extensions.dart';
part 'fonts.dart';
part 'margins.dart';
part 'paddings.dart';

class DimensionalThemeService implements KThemeService {
  @override
  KThemeFontLineHeights get fontLineHeights => _DimensionalFontLineHeights();

  @override
  KThemeFontSizes get fontSizes => _DimensionalFontSizes();

  @override
  KThemeFontWeights get fontWeights => _DimensionalFontWeights();

  @override
  KThemeMargins get margins => _DimensionalMargins();

  @override
  KThemePaddings get paddings => _DimensionalPaddings();
}

abstract class DimensionalPolicies {
  DimensionalPolicies._();

  static double get policyRatioForWidth {
    const designWidth = 360.0;

    final deviceWidth = () {
      late double width;

      final context = KAppX.currentContext;

      if (context != null) {
        width = MediaQuery.of(context).size.width;
      } else {
        width = designWidth;
      }

      return width;
    }();

    final widthScaleRatio = deviceWidth / designWidth;

    return widthScaleRatio;
  }

  static double get policyRatioForHeight {
    const designHeight = 800.0;

    final deviceHeight = () {
      late double height;
      late EdgeInsets padding;

      final context = KAppX.currentContext;

      if (context != null) {
        // height = MediaQuery.of(context).size.height;
        padding = MediaQuery.of(context).padding;
        height= MediaQuery.of(context).size.height - padding.bottom;
      } else {
        height = designHeight;
      }

      return height;
    }();

    final heightScaleRatio = deviceHeight / designHeight;

    return heightScaleRatio;
  }
}
