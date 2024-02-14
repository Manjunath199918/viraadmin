import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:flutter/material.dart';

class KTextStyles {
  final currentTheme = KAppX.globalProvider.read(KAppX.theme.current);
  TextStyle get s10WhiteBold {
    return TextStyle(
      fontSize: currentTheme.themeBox.fontSizes.s10,
      color: currentTheme.themeBox.colors.white,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s10DarkBlueBold {
    return TextStyle(
      fontSize: currentTheme.themeBox.fontSizes.s10,
      color: currentTheme.themeBox.colors.darkBlue,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,

    );
  }

  TextStyle get s14onSecondaryRegular {
    return TextStyle(
      color: currentTheme.themeBox.colors.onSecondary,
      fontWeight: currentTheme.themeBox.fontWeights.wRegular,
      fontSize: currentTheme.themeBox.fontSizes.s14,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s14onSecondaryVariantRegular {
    return TextStyle(
      color: currentTheme.themeBox.colors.onSecondaryVariant,
      fontWeight: currentTheme.themeBox.fontWeights.wRegular,
      fontSize: currentTheme.themeBox.fontSizes.s14,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }

  TextStyle get s14onBackgroundRegular {
    return TextStyle(
      color: currentTheme.themeBox.colors.onBackground,
      fontWeight: currentTheme.themeBox.fontWeights.wRegular,
      fontSize: currentTheme.themeBox.fontSizes.s14,

    );
  }
  TextStyle get s14onBackgroundBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.onBackground,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s14,

    );
  }
  TextStyle get s12onBackgroundRegular {
    return TextStyle(
      color: currentTheme.themeBox.colors.onBackground,
      fontWeight: currentTheme.themeBox.fontWeights.wRegular,
      fontSize: currentTheme.themeBox.fontSizes.s12,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s12onBackgroundBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.onBackground,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s12,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s12onBackgroundVariantRegular {
    return TextStyle(
      color: currentTheme.themeBox.colors.onBackgroundVariant,
      fontWeight: currentTheme.themeBox.fontWeights.wRegular,
      fontSize: currentTheme.themeBox.fontSizes.s12,

    );
  }
  TextStyle get s12GreyVariantRegular {
    return TextStyle(
      color: currentTheme.themeBox.colors.greyVariant,
      fontWeight: currentTheme.themeBox.fontWeights.wRegular,
      fontSize: currentTheme.themeBox.fontSizes.s12,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s10GreyVariantRegular {
    return TextStyle(
      color: currentTheme.themeBox.colors.greyVariant,
      fontWeight: currentTheme.themeBox.fontWeights.wRegular,
      fontSize: currentTheme.themeBox.fontSizes.s10,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }


  TextStyle get s12BlackRegular {
    return TextStyle(
      color: currentTheme.themeBox.colors.black,
      fontWeight: currentTheme.themeBox.fontWeights.wRegular,
      fontSize: currentTheme.themeBox.fontSizes.s12,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }

  TextStyle get s14BlackRegular {
    return TextStyle(
      color: currentTheme.themeBox.colors.black,
      fontWeight: currentTheme.themeBox.fontWeights.wRegular,
      fontSize: currentTheme.themeBox.fontSizes.s14,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }



  TextStyle get s12BlackBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.black,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s12,

    );
  }
  TextStyle get s8BlackBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.black,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s10,

    );
  }
  TextStyle get s12ErrorVariantRegular {
    return TextStyle(
      color: currentTheme.themeBox.colors.errorVariant,
      fontWeight: currentTheme.themeBox.fontWeights.wRegular,
      fontSize: currentTheme.themeBox.fontSizes.s12,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s12onErrorRegular {
    return TextStyle(
      color: currentTheme.themeBox.colors.onError,
      fontWeight: currentTheme.themeBox.fontWeights.wRegular,
      fontSize: currentTheme.themeBox.fontSizes.s12,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s12WhiteBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.white,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s12,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s36GreyishBlueRegular {
    return TextStyle(
      color: currentTheme.themeBox.colors.greyishBlue,
      fontWeight: currentTheme.themeBox.fontWeights.wRegular,
      fontSize: currentTheme.themeBox.fontSizes.s36,

    );
  }
  TextStyle get s12WhiteRegular {
    return TextStyle(
      color: currentTheme.themeBox.colors.white,
      fontWeight: currentTheme.themeBox.fontWeights.wRegular,
      fontSize: currentTheme.themeBox.fontSizes.s12,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }

  TextStyle get s14BlackBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.black,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s14,
       // height: currentTheme.themeBox.fontLineHeights.lh18 /
       //     currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s14BlackVariantBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.blackVariant,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s14,

    );
  }
  TextStyle get s14BlackBoldNoHeight {
    return TextStyle(
      color: currentTheme.themeBox.colors.black,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s14,

    );
  }
  TextStyle get s14onErrorBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.onError,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s14,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }

  TextStyle get s16BlackRegular {
    return TextStyle(
      color: currentTheme.themeBox.colors.black,
      fontWeight: currentTheme.themeBox.fontWeights.wRegular,
      fontSize: currentTheme.themeBox.fontSizes.s16,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s16DarkBlueBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.darkBlue,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s16,

    );
  }

  TextStyle get s16onErrorBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.onError,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s16,

    );
  }
  TextStyle get s18DarkBlueBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.darkBlue,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s18,

    );
  }
  TextStyle get s16onSecondaryRegular {
    return TextStyle(
      color: currentTheme.themeBox.colors.onSecondary,
      fontWeight: currentTheme.themeBox.fontWeights.wRegular,
      fontSize: currentTheme.themeBox.fontSizes.s16,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s16onSecondaryBold {
    return TextStyle(

        color: currentTheme.themeBox.colors.onSecondary,
        fontWeight: currentTheme.themeBox.fontWeights.wBold,
        fontSize: currentTheme.themeBox.fontSizes.s16,
        height: currentTheme.themeBox.fontLineHeights.lh24 /
            currentTheme.themeBox.fontLineHeights.lh14
    );
  }
  TextStyle get s16BlackBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.black,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s16,


    );
  }
  TextStyle get s10onSecondaryBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.onSecondary,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s10,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s10,
    );
  }

  TextStyle get s10BlackBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.black,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s10,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s10,
    );
  }
  TextStyle get s10PrimaryBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.primary,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s16,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s10,
    );
  }
  TextStyle get s16WhiteBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.white,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s16,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s16PrimaryBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.primary,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s16,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s20BlackBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.black,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s20,
      // height: currentTheme.themeBox.fontLineHeights.lh18 /
      //     currentTheme.themeBox.fontSizes.s12,
    );
  }
   TextStyle get s20PrimaryBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.primary,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s20,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s20GreenBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.green,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s20,
      // height: currentTheme.themeBox.fontLineHeights.lh18 /
      //     currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s20WhiteBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.white,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s20,
      // height: currentTheme.themeBox.fontLineHeights.lh18 /
      //     currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s20DarkBlueBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.darkBlue,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s20,
      // height: currentTheme.themeBox.fontLineHeights.lh18 /
      //     currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s20onBackgroundBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.onBackground,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s20,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s24BlackBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.black,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s24,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s25BlackBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.black,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s25,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s24WhiteBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.white,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s24,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s24DarkBlueBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.darkBlue,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s24,

    );
  }
  TextStyle get s48WhiteBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.white,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s48,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s24BlackRegular {
    return TextStyle(
      color: currentTheme.themeBox.colors.black,
      fontWeight: currentTheme.themeBox.fontWeights.wRegular,
      fontSize: currentTheme.themeBox.fontSizes.s24,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s18BlackBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.black,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s18,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s18,
    );
  }
  TextStyle get s18WhiteBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.white,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s18,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s18,
    );
  }

  TextStyle get s12onSecondaryBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.onSecondary,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s12,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }

  TextStyle get s14SecondaryRegular {
    return TextStyle(
      color: currentTheme.themeBox.colors.secondary,
      fontWeight: currentTheme.themeBox.fontWeights.wRegular,
      fontSize: currentTheme.themeBox.fontSizes.s14,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s14onBackgroundVariantRegular {
    return TextStyle(
      color: currentTheme.themeBox.colors.onBackgroundVariant,
      fontWeight: currentTheme.themeBox.fontWeights.wRegular,
      fontSize: currentTheme.themeBox.fontSizes.s14,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }
  TextStyle get s20onBackgroundVariantRegular {
    return TextStyle(
      color: currentTheme.themeBox.colors.onBackgroundVariant,
      fontWeight: currentTheme.themeBox.fontWeights.wRegular,
      fontSize: currentTheme.themeBox.fontSizes.s20,
      height: currentTheme.themeBox.fontLineHeights.lh18 /
          currentTheme.themeBox.fontSizes.s12,
    );
  }

  TextStyle get s14WhiteRegular {
    return TextStyle(
        color: currentTheme.themeBox.colors.white,
        fontWeight: currentTheme.themeBox.fontWeights.wRegular,
        fontSize: currentTheme.themeBox.fontSizes.s14);
  }
  TextStyle get s14WhiteBold {
    return TextStyle(
        color: currentTheme.themeBox.colors.white,
        fontWeight: currentTheme.themeBox.fontWeights.wBold,
        fontSize: currentTheme.themeBox.fontSizes.s14);
  }
  TextStyle get s14PrimaryBold {
    return TextStyle(
        color: currentTheme.themeBox.colors.primary,
        fontWeight: currentTheme.themeBox.fontWeights.wBold,
        fontSize: currentTheme.themeBox.fontSizes.s14);
  }

  TextStyle get s14greyVariantBold {
    return TextStyle(
        color: currentTheme.themeBox.colors.greyVariant,
        fontWeight: currentTheme.themeBox.fontWeights.wBold,
        fontSize: currentTheme.themeBox.fontSizes.s14);
  }
  TextStyle get s14PaleBlueBold {
    return TextStyle(
        color: currentTheme.themeBox.colors.paleBlue,
        fontWeight: currentTheme.themeBox.fontWeights.wBold,
        fontSize: currentTheme.themeBox.fontSizes.s14);
  }
  TextStyle get s12DarkBlueRegular {
    return TextStyle(
      color: currentTheme.themeBox.colors.darkBlue,
      fontWeight: currentTheme.themeBox.fontWeights.wRegular,
      fontSize: currentTheme.themeBox.fontSizes.s12,

    );
  }
  TextStyle get s12DarkBlueBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.darkBlue,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s12,

    );
  }
  TextStyle get s12BlackVariantBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.blackVariant,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s12,

    );
  }
  TextStyle get s16greenvariantBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.greenvariant,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s16,

    );
  }
  TextStyle get s16greenBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.green,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s16,

    );
  }
  TextStyle get s16blueVarientBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.blueVarient,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s16,

    );
  }
  TextStyle get s16pinkVarinetBold {
    return TextStyle(
      color: currentTheme.themeBox.colors.pinkVarinet,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      fontSize: currentTheme.themeBox.fontSizes.s16,

    );
  }
}
