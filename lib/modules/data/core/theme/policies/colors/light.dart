part of '../../theme.dart';

class KThemeColorsLightImpl implements KThemeColors {
  @override
  Color get primary => HexColor.fromHex('#003F5F');

  @override
  Color get onPrimary => Colors.white;

  @override
  Color get primaryVariant => HexColor.fromHex('#F2F4F7');

  @override
  Color get onPrimaryVariant => throw UnimplementedError();

  @override
  Color get secondary => HexColor.fromHex('#273865');

  @override
  Color get onSecondary => HexColor.fromHex('#CCCCCC');

  @override
  Color get secondaryVariant => HexColor.fromHex('#F5F7F9');

  @override
  Color get onSecondaryVariant => HexColor.fromHex('#78797E');

  @override
  Color get background => HexColor.fromHex('#F8FAFB');

  @override
  Color get onBackground => HexColor.fromHex('#414141');

  @override
  Color get backgroundVariant => Color.fromRGBO(154, 154, 154, 0.1);

  @override
  Color get onBackgroundVariant => HexColor.fromHex('#9A9A9A');

  @override
  Color get success => Color.fromRGBO(88, 215, 154, 0.2);

  @override
  Color get onSuccess => HexColor.fromHex('#58D79A');

  @override
  Color get error => Color.fromRGBO(247, 57, 57, 0.2);

  @override
  Color get onError => HexColor.fromHex('#F73939');

  @override
  Color get errorVariant => throw UnimplementedError();

  @override
  Color get warning => Color.fromRGBO(211, 195, 55, 0.2);

  @override
  Color get onErrorVariant => HexColor.fromHex('#D3C337');

  @override
  Color get black => Colors.black;

  @override
  Color get loader => primary;

  @override
  Color get white => Colors.white;

  @override
  Color get blankButton => HexColor.fromHex('#414141');

  @override
  Color get green => HexColor.fromHex('#58D79A');

  @override
  Color get whatsappColor => HexColor.fromHex('#3EB37A');

  @override
  Color get darkBlue => HexColor.fromHex('#1B41A1');

  @override
  Color get paleGreen => HexColor.fromHex('#72CC7F');

  @override
  Color get blackVariant => HexColor.fromHex('#545A63');
  @override
  Color get paleGrey => HexColor.fromHex('#F4F4F4');
  @override
  Color get greyVariant => HexColor.fromHex('#B9B9B9');
  @override
  Color get paleBlue => HexColor.fromHex('#94A5CF');
  @override
  Color get greyishBlue => HexColor.fromHex('#CED2DC');
  @override
  Color get greenvariant => Colors.green.withOpacity(0.2);
  @override
  Color get pinkVarinet => Colors.pink.withOpacity(0.2);
  @override
  Color get blueVarient => Colors.blue.withOpacity(0.2);

}
