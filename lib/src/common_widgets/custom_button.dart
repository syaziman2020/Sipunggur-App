import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme_manager/color_manager.dart';
import '../theme_manager/font_manager.dart';
import '../theme_manager/style_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 10.w,
            backgroundColor: ColorManager.primaryLight,
            shadowColor: ColorManager.primaryLight),
        onPressed: onTap,
        child: Text(
          title,
          style: getTextStyle(
            FontSizeManager.f16,
            FontFamilyConstant.fontFamily,
            FontWeightManager.semiBold,
            ColorManager.whiteC,
          ),
        ),
      ),
    );
  }
}
