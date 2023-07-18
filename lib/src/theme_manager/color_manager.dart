import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex('#219653');
  static Color secondary = HexColor.fromHex('#6FCF97');
  static Color blackC = HexColor.fromHex('#000000');
  static Color greyC = HexColor.fromHex('#8A899C');
  static Color greenC = HexColor.fromHex('#ECFFE9');
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
