import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme_manager/color_manager.dart';
import '../theme_manager/font_manager.dart';
import '../theme_manager/style_manager.dart';

class CardControl extends StatelessWidget {
  const CardControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 14.w,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorManager.blackC.withOpacity(0.3),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Node Control',
            style: getTextStyle(
              FontSizeManager.f16,
              FontFamilyConstant.fontFamily,
              FontWeightManager.semiBold,
              ColorManager.whiteC,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.water_drop,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Air 1',
                    style: getTextStyle(
                      FontSizeManager.f15,
                      FontFamilyConstant.fontFamily,
                      FontWeightManager.regular,
                      ColorManager.whiteC,
                    ),
                  ),
                ],
              ),
              Container(
                width: 60.w,
                padding: EdgeInsets.symmetric(
                  vertical: 4.w,
                ),
                decoration: BoxDecoration(
                  color: ColorManager.primaryLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'ON',
                    style: getTextStyle(
                      FontSizeManager.f15,
                      FontFamilyConstant.fontFamily,
                      FontWeightManager.semiBold,
                      ColorManager.whiteC,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.water_drop,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Air 2',
                    style: getTextStyle(
                      FontSizeManager.f15,
                      FontFamilyConstant.fontFamily,
                      FontWeightManager.regular,
                      ColorManager.whiteC,
                    ),
                  ),
                ],
              ),
              Container(
                width: 60.w,
                padding: EdgeInsets.symmetric(
                  vertical: 4.w,
                ),
                decoration: BoxDecoration(
                  color: ColorManager.primaryLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'ON',
                    style: getTextStyle(
                      FontSizeManager.f15,
                      FontFamilyConstant.fontFamily,
                      FontWeightManager.semiBold,
                      ColorManager.whiteC,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.water_drop,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Air 3',
                    style: getTextStyle(
                      FontSizeManager.f15,
                      FontFamilyConstant.fontFamily,
                      FontWeightManager.regular,
                      ColorManager.whiteC,
                    ),
                  ),
                ],
              ),
              Container(
                width: 60.w,
                padding: EdgeInsets.symmetric(
                  vertical: 4.w,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'OFF',
                    style: getTextStyle(
                      FontSizeManager.f15,
                      FontFamilyConstant.fontFamily,
                      FontWeightManager.semiBold,
                      ColorManager.whiteC,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.water_drop,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Air 4',
                    style: getTextStyle(
                      FontSizeManager.f15,
                      FontFamilyConstant.fontFamily,
                      FontWeightManager.regular,
                      ColorManager.whiteC,
                    ),
                  ),
                ],
              ),
              Container(
                width: 60.w,
                padding: EdgeInsets.symmetric(
                  vertical: 4.w,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'OFF',
                    style: getTextStyle(
                      FontSizeManager.f15,
                      FontFamilyConstant.fontFamily,
                      FontWeightManager.semiBold,
                      ColorManager.whiteC,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
