import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getTextStyle(
  double fontSize,
  String fontFamily,
  FontWeight fontWeight,
  Color color,
) {
  return GoogleFonts.raleway().copyWith(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}
