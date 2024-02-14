part of '../theme.dart';

abstract class KThemeColors {
  factory KThemeColors.dark() => KThemeColorsDarkImpl();

  factory KThemeColors.light() => KThemeColorsLightImpl();

  /// [primary] represents the color that will be used often across the application
  /// to draw attention, and sometimes brand awareness.
  ///
  Color get primary;

  /// [onPrimary] is the color of elements such as texts, icon, etc that are to be rendered
  /// above [primary].
  Color get onPrimary;

  /// [primaryVariant] represents an alternative to [primary] color. It can used stand-alone
  /// or can be used to create gradients alongside [primary].
  ///
  Color get primaryVariant;

  /// [onPrimaryVariant] is the color of elements such as texts, icon, etc that are to be rendered
  /// above [primaryVariant].
  Color get onPrimaryVariant;

  /// [secondary], also known as accent color, is to be used sparingly across the app to add a bit of differentiating
  /// touch in places where [primary] is already being used extensively.
  ///
  Color get secondary;

  /// [onSecondary] is the color of elements such as texts, icon, etc that are to be rendered
  /// above [secondary].
  Color get onSecondary;

  /// [secondaryVariant] is an alternative to [secondary] colors. It can used stand-alone or can be
  /// used to create gradients alongside [secondary].
  ///
  Color get secondaryVariant;

  /// [onSecondaryVariant] is the color of elements such as texts, icon, etc that are to be rendered
  /// above [secondaryVariant].
  Color get onSecondaryVariant;

  /// [background] is to be used as backgrounds of such elements as [Scaffold], [ListView]s, etc.
  ///
  Color get background;

  /// [onBackground] is the color of elements such as texts, icon, etc that are to be rendered
  /// above [background].
  Color get onBackground;

  /// [backgroundVariant] is an alternative to [background] color. It can used stand-alone or can be
  /// used to create gradients alongside [background].
  ///
  Color get backgroundVariant;

  /// [onBackgroundVariant] is the color of elements such as texts, icon, etc that are to be rendered
  /// above [backgroundVariant].
  Color get onBackgroundVariant;

  /// [success] is the color of the success element.
  Color get success;

  /// [onSuccess] is the color of elements such as texts, icon, etc that are to be rendered
  /// above [success].
  Color get onSuccess;

  /// [error] is the color of the failure element.
  Color get error;

  /// [onError] is the color of elements such as texts, icon, etc that are to be rendered
  /// above [error].
  Color get onError;

  /// [errorVariant] is a variant of the [error] color used to display warning or error messages.
  Color get errorVariant;

  /// [onErrorVariant] is the color of elements such as texts, icon, etc that are to be rendered above [errorVariant].
  Color get onErrorVariant;

  /// [warning] is used to display warning or elements which need user's attention because something could be invalid.
  Color get warning;

  /// Just pure black
  Color get black;

  /// Just pure white
  Color get white;

  /// Color for loader
  Color get loader;

  Color get blankButton;

  Color get whatsappColor;

  Color get green;

  Color get darkBlue;

  Color get paleGreen;

  Color get blackVariant;

  Color get paleGrey;

  Color get greyVariant;
   Color get paleBlue;
   Color get greyishBlue;
   Color get greenvariant;
   Color get pinkVarinet;
   Color get blueVarient;
}
