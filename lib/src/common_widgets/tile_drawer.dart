import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../theme_manager/color_manager.dart';
import '../theme_manager/font_manager.dart';
import '../theme_manager/style_manager.dart';

class TileDrawer extends StatelessWidget {
  final Function() onTap;
  final String urlImage;
  final String title;
  final Color color;

  TileDrawer({
    super.key,
    required this.onTap,
    required this.urlImage,
    required this.title,
    this.color = const Color(0xff8A899C),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: ColorManager.whiteC,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 24.w,
            ),
            SvgPicture.asset(
              urlImage,
              fit: BoxFit.cover,
              color: color,
              width: 22.w,
              height: 22.w,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: getTextStyle(
                FontSizeManager.f14,
                FontFamilyConstant.fontFamily,
                FontWeightManager.regular,
                color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
