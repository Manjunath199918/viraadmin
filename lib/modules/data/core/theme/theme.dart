import 'dart:developer';

import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/modules/domain/core/theme/theme.dart';
import 'package:viraadmin/utils/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'policies/colors/dark.dart';
part 'policies/colors/light.dart';
part 'policies/fonts.dart';
part 'policies/margins.dart';
part 'policies/paddings.dart';
part 'services/theme_service.dart';

class KThemeBoxImpl implements KThemeBox {
  @override
  void bootDown() {
    log('[ThemeBox.bootDown]');
    // TODO: implement bootDown
  }

  @override
  Future<void> bootUp() async {
    log('[ThemeBox.bootUp]');

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
  }

  @override
  void onBootUp() {
    // TODO: implement onBootUp
  }

  ///Change object to change the service
  late KThemeService _themeService;

  late KThemeType _currentType;
  late KThemeColors _currentColorsScheme;

  KThemeBoxImpl() {
    _themeService = DimensionalThemeService();

    _currentType = KThemeType.light;
    _currentColorsScheme = KThemeColors.light();
  }

  @override
  KThemeType get type => _currentType;

  @override
  KThemeColors get colors => _currentColorsScheme;

  void _switchToDarkTheme() {
    _currentType = KThemeType.dark;
    _currentColorsScheme = KThemeColors.dark();
  }

  void _switchToLightTheme() {
    _currentType = KThemeType.light;
    _currentColorsScheme = KThemeColors.light();
  }

  @override
  void switchTo(KThemeType type) {
    type == KThemeType.dark ? _switchToDarkTheme() : _switchToLightTheme();
  }

  @override
  KThemeFontSizes get fontSizes => _KThemeFontSizesImpl(_themeService.fontSizes);

  @override
  KThemeFontLineHeights get fontLineHeights => _KThemeFontLineHeightsImpl(_themeService.fontLineHeights);

  @override
  KThemeFontWeights get fontWeights => _KThemeFontWeightsImpl(_themeService.fontWeights);

  @override
  KThemeMargins get margins => _KThemeMarginsImpl(_themeService.margins);

  @override
  KThemePaddings get paddings => _KThemePaddingsImpl(_themeService.paddings);
}
