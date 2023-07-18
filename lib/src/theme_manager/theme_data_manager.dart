import 'package:flutter/material.dart';
import 'package:sipunggur_app/src/theme_manager/color_manager.dart';
import 'package:sipunggur_app/src/theme_manager/font_manager.dart';

ThemeData getApplicationThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.whiteC,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.whiteC,
      elevation: 0,
    ),
    fontFamily: FontFamilyConstant.fontFamily,
  );
}
