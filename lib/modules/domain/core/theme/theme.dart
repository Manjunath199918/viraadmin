import 'package:viraadmin/modules/data/core/theme/theme.dart';
import 'package:viraadmin/modules/domain/core/core.dart';
import 'package:flutter/material.dart';

part 'policies/colors.dart';
part 'policies/fonts.dart';
part 'policies/margins.dart';
part 'policies/paddings.dart';

enum KThemeType { dark, light }

abstract class KThemeBox implements KCoreModule<void> {
  static final KThemeBox instance = KThemeBoxImpl();

  KThemeType get type;

  KThemeColors get colors;

  void switchTo(KThemeType type);

  KThemeFontSizes get fontSizes;

  KThemeFontWeights get fontWeights;

  KThemeFontLineHeights get fontLineHeights;

  KThemeMargins get margins;

  KThemePaddings get paddings;
}
