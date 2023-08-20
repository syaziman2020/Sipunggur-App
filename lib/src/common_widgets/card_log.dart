import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../theme_manager/color_manager.dart';
import '../theme_manager/font_manager.dart';
import '../theme_manager/style_manager.dart';

class CardLog extends StatelessWidget {
  const CardLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.w),
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 15.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorManager.secondary),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/humidity_icon.svg',
                    fit: BoxFit.cover,
                    width: 22.w,
                    height: 22.w,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'Humidity',
                    style: getTextStyle(
                      FontSizeManager.f14,
                      FontFamilyConstant.fontFamily,
                      FontWeightManager.regular,
                      ColorManager.greyC,
                    ),
                  ),
                ],
              ),
              Text(
                '75%',
                style: getTextStyle(
                  FontSizeManager.f14,
                  FontFamilyConstant.fontFamily,
                  FontWeightManager.bold,
                  ColorManager.blackC,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/soil_icon.svg',
                    fit: BoxFit.cover,
                    width: 22.w,
                    height: 22.w,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'Soil Moisture',
                    style: getTextStyle(
                      FontSizeManager.f14,
                      FontFamilyConstant.fontFamily,
                      FontWeightManager.regular,
                      ColorManager.greyC,
                    ),
                  ),
                ],
              ),
              Text(
                '75%',
                style: getTextStyle(
                  FontSizeManager.f14,
                  FontFamilyConstant.fontFamily,
                  FontWeightManager.bold,
                  ColorManager.blackC,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/humidity_icon.svg',
                    fit: BoxFit.cover,
                    width: 22.w,
                    height: 22.w,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'Temperature',
                    style: getTextStyle(
                      FontSizeManager.f14,
                      FontFamilyConstant.fontFamily,
                      FontWeightManager.regular,
                      ColorManager.greyC,
                    ),
                  ),
                ],
              ),
              Text(
                '29°C',
                style: getTextStyle(
                  FontSizeManager.f14,
                  FontFamilyConstant.fontFamily,
                  FontWeightManager.bold,
                  ColorManager.blackC,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Divider(
            color: ColorManager.secondary,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tanggal',
                style: getTextStyle(
                  FontSizeManager.f12,
                  FontFamilyConstant.fontFamily,
                  FontWeightManager.regular,
                  ColorManager.greyC,
                ),
              ),
              Text(
                'Waktu',
                style: getTextStyle(
                  FontSizeManager.f12,
                  FontFamilyConstant.fontFamily,
                  FontWeightManager.regular,
                  ColorManager.greyC,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '12/12/2023',
                style: getTextStyle(
                  FontSizeManager.f12,
                  FontFamilyConstant.fontFamily,
                  FontWeightManager.regular,
                  ColorManager.blackC,
                ),
              ),
              Text(
                '18:00 WIB',
                style: getTextStyle(
                  FontSizeManager.f12,
                  FontFamilyConstant.fontFamily,
                  FontWeightManager.regular,
                  ColorManager.blackC,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
