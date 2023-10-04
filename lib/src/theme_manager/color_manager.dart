import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex('#219653');
  static Color primaryLight = HexColor.fromHex('#27AE60');
  static Color secondary = HexColor.fromHex('#6FCF97');
  static Color blackC = HexColor.fromHex('#1D2132');
  static Color greyC = HexColor.fromHex('#8A899C');
  static Color greyDarkC = HexColor.fromHex('#7C7C8C');
  static Color greyBorder = HexColor.fromHex('#EAEAF0');
  static Color greyNavbar = HexColor.fromHex('#BDBDBD');
  static Color greenC = HexColor.fromHex('#ECFFE9');
  static Color greyLightC = HexColor.fromHex('#ECE9FF');
  static Color whiteC = HexColor.fromHex('#ffffff');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }

    return Color(int.parse(hexColorString, radix: 16));
  }
}
