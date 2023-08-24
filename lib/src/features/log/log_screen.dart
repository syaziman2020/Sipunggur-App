import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sipunggur_app/src/common_widgets/card_log.dart';
import 'package:sipunggur_app/src/theme_manager/color_manager.dart';
import 'package:sipunggur_app/src/theme_manager/font_manager.dart';
import 'package:sipunggur_app/src/theme_manager/style_manager.dart';

class LogScreen extends StatelessWidget {
  const LogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.w,
          ),
          Text(
            'Log Data',
            style: getTextStyle(
              FontSizeManager.f18,
              FontFamilyConstant.fontFamily,
              FontWeightManager.bold,
              ColorManager.blackC,
            ),
          ),
          CardLog(),
        ],
      ),
    );
  }
}
