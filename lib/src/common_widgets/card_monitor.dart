import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme_manager/color_manager.dart';
import '../theme_manager/font_manager.dart';
import '../theme_manager/style_manager.dart';

class CardMonitor extends StatelessWidget {
  const CardMonitor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
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
            'Node 1',
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
                  Image.asset(
                    'assets/images/pot_icon.png',
                    width: 26.w,
                    height: 26.w,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Pot 1',
                    style: getTextStyle(
                      FontSizeManager.f15,
                      FontFamilyConstant.fontFamily,
                      FontWeightManager.regular,
                      ColorManager.whiteC,
                    ),
                  ),
                ],
              ),
              Text(
                '30%',
                style: getTextStyle(
                  FontSizeManager.f18,
                  FontFamilyConstant.fontFamily,
                  FontWeightManager.semiBold,
                  ColorManager.whiteC,
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
                  Image.asset(
                    'assets/images/pot_icon.png',
                    width: 26.w,
                    height: 26.w,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Pot 2',
                    style: getTextStyle(
                      FontSizeManager.f15,
                      FontFamilyConstant.fontFamily,
                      FontWeightManager.regular,
                      ColorManager.whiteC,
                    ),
                  ),
                ],
              ),
              Text(
                '40%',
                style: getTextStyle(
                  FontSizeManager.f18,
                  FontFamilyConstant.fontFamily,
                  FontWeightManager.semiBold,
                  ColorManager.whiteC,
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
                  Image.asset(
                    'assets/images/pot_icon.png',
                    width: 26.w,
                    height: 26.w,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Pot 3',
                    style: getTextStyle(
                      FontSizeManager.f15,
                      FontFamilyConstant.fontFamily,
                      FontWeightManager.regular,
                      ColorManager.whiteC,
                    ),
                  ),
                ],
              ),
              Text(
                '30%',
                style: getTextStyle(
                  FontSizeManager.f18,
                  FontFamilyConstant.fontFamily,
                  FontWeightManager.semiBold,
                  ColorManager.whiteC,
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
                  Image.asset(
                    'assets/images/pot_icon.png',
                    width: 26.w,
                    height: 26.w,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Pot 4',
                    style: getTextStyle(
                      FontSizeManager.f15,
                      FontFamilyConstant.fontFamily,
                      FontWeightManager.regular,
                      ColorManager.whiteC,
                    ),
                  ),
                ],
              ),
              Text(
                '30%',
                style: getTextStyle(
                  FontSizeManager.f18,
                  FontFamilyConstant.fontFamily,
                  FontWeightManager.semiBold,
                  ColorManager.whiteC,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
