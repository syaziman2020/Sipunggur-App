import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme_manager/color_manager.dart';
import '../theme_manager/font_manager.dart';
import '../theme_manager/style_manager.dart';

class TileSetting extends StatelessWidget {
  final String title;
  IconData iconData;
  final Function() onTap;
  TileSetting({
    super.key,
    required this.title,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 14.w),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.primaryLight.withOpacity(0.2),
                        offset: const Offset(0, 10),
                        blurRadius: 20,
                      ),
                    ],
                    color: ColorManager.primary.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                  padding: EdgeInsets.all(10.w),
                  child: Icon(
                    iconData,
                    size: 24,
                  ),
                ),
                Text(
                  title,
                  style: getTextStyle(
                    FontSizeManager.f16,
                    FontFamilyConstant.fontFamily,
                    FontWeightManager.medium,
                    ColorManager.blackC,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 19.w,
            ),
          ],
        ),
      ),
    );
  }
}
