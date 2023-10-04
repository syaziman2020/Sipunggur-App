import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:sipunggur_app/src/common_widgets/custom_button.dart';

import '../../../theme_manager/color_manager.dart';
import '../../../theme_manager/font_manager.dart';
import '../../../theme_manager/style_manager.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  bool? senB = false;
  bool? selB = false;
  bool? rabB = false;
  bool? kamB = false;
  bool? jumB = false;
  bool? sabB = false;
  bool? minB = false;

  String _code = '';
  bool _onEditing = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Schedule',
            style: getTextStyle(
              FontSizeManager.f18,
              FontFamilyConstant.fontFamily,
              FontWeightManager.bold,
              ColorManager.blackC,
            ),
          ),
          SizedBox(
            height: 20.w,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Sen',
                      style: getTextStyle(
                        FontSizeManager.f14,
                        FontFamilyConstant.fontFamily,
                        FontWeightManager.semiBold,
                        ColorManager.blackC,
                      ),
                    ),
                    Checkbox(
                        fillColor:
                            MaterialStateProperty.all(ColorManager.primary),
                        checkColor: ColorManager.whiteC,
                        activeColor: ColorManager.primaryLight,
                        value: this.senB,
                        onChanged: (value) {
                          setState(() {
                            this.senB = value;
                          });
                        })
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Sel',
                      style: getTextStyle(
                        FontSizeManager.f14,
                        FontFamilyConstant.fontFamily,
                        FontWeightManager.semiBold,
                        ColorManager.blackC,
                      ),
                    ),
                    Checkbox(
                        fillColor:
                            MaterialStateProperty.all(ColorManager.primary),
                        checkColor: ColorManager.whiteC,
                        activeColor: ColorManager.primaryLight,
                        value: this.selB,
                        onChanged: (value) {
                          setState(() {
                            this.selB = value;
                          });
                        })
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Rab',
                      style: getTextStyle(
                        FontSizeManager.f14,
                        FontFamilyConstant.fontFamily,
                        FontWeightManager.semiBold,
                        ColorManager.blackC,
                      ),
                    ),
                    Checkbox(
                        fillColor:
                            MaterialStateProperty.all(ColorManager.primary),
                        checkColor: ColorManager.whiteC,
                        activeColor: ColorManager.primaryLight,
                        value: this.rabB,
                        onChanged: (value) {
                          setState(() {
                            this.rabB = value;
                          });
                        })
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Kam',
                      style: getTextStyle(
                        FontSizeManager.f14,
                        FontFamilyConstant.fontFamily,
                        FontWeightManager.semiBold,
                        ColorManager.blackC,
                      ),
                    ),
                    Checkbox(
                        fillColor:
                            MaterialStateProperty.all(ColorManager.primary),
                        checkColor: ColorManager.whiteC,
                        activeColor: ColorManager.primaryLight,
                        value: this.kamB,
                        onChanged: (value) {
                          setState(() {
                            this.kamB = value;
                          });
                        })
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Jum',
                      style: getTextStyle(
                        FontSizeManager.f14,
                        FontFamilyConstant.fontFamily,
                        FontWeightManager.semiBold,
                        ColorManager.blackC,
                      ),
                    ),
                    Checkbox(
                        fillColor:
                            MaterialStateProperty.all(ColorManager.primary),
                        checkColor: ColorManager.whiteC,
                        activeColor: ColorManager.primaryLight,
                        value: this.jumB,
                        onChanged: (value) {
                          setState(() {
                            this.jumB = value;
                          });
                        })
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Sab',
                      style: getTextStyle(
                        FontSizeManager.f14,
                        FontFamilyConstant.fontFamily,
                        FontWeightManager.semiBold,
                        ColorManager.blackC,
                      ),
                    ),
                    Checkbox(
                        fillColor:
                            MaterialStateProperty.all(ColorManager.primary),
                        checkColor: ColorManager.whiteC,
                        activeColor: ColorManager.primaryLight,
                        value: this.sabB,
                        onChanged: (value) {
                          setState(() {
                            this.sabB = value;
                          });
                        })
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Min',
                      style: getTextStyle(
                        FontSizeManager.f14,
                        FontFamilyConstant.fontFamily,
                        FontWeightManager.semiBold,
                        ColorManager.blackC,
                      ),
                    ),
                    Checkbox(
                        fillColor:
                            MaterialStateProperty.all(ColorManager.primary),
                        checkColor: ColorManager.whiteC,
                        activeColor: ColorManager.primaryLight,
                        value: this.minB,
                        onChanged: (value) {
                          setState(() {
                            this.minB = value;
                          });
                        })
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Divider(
            color: ColorManager.primaryLight.withOpacity(0.5),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Pagi',
            style: getTextStyle(
              FontSizeManager.f18,
              FontFamilyConstant.fontFamily,
              FontWeightManager.bold,
              ColorManager.blackC,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: ColorManager.primaryLight,
                width: 2,
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 7.h),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(5.w),
                            ),
                            child: Center(
                              child: Text(
                                'Waktu',
                                style: getTextStyle(
                                  FontSizeManager.f16,
                                  FontFamilyConstant.fontFamily,
                                  FontWeightManager.semiBold,
                                  ColorManager.whiteC,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 14.h,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 50.w,
                                        height: 50.w,
                                        margin: const EdgeInsets.only(
                                            top: 5, right: 7),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: ColorManager.greyC
                                                .withOpacity(0.2),
                                          ),
                                          color: ColorManager.greyLightC,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                            child: Text(
                                          '16',
                                          style: getTextStyle(
                                            FontSizeManager.f22,
                                            FontFamilyConstant.fontFamily,
                                            FontWeightManager.bold,
                                            ColorManager.blackC,
                                          ),
                                        )),
                                      ),
                                      Text(
                                        ':',
                                        style: getTextStyle(
                                          FontSizeManager.f28,
                                          FontFamilyConstant.fontFamily,
                                          FontWeight.bold,
                                          ColorManager.blackC,
                                        ),
                                      ),
                                      Container(
                                        width: 50.w,
                                        height: 50.w,
                                        margin: const EdgeInsets.only(
                                            top: 5, left: 7),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: ColorManager.greyC
                                                .withOpacity(0.2),
                                          ),
                                          color: ColorManager.greyLightC,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                            child: Text(
                                          '00',
                                          style: getTextStyle(
                                            FontSizeManager.f22,
                                            FontFamilyConstant.fontFamily,
                                            FontWeightManager.bold,
                                            ColorManager.blackC,
                                          ),
                                        )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 7.h),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(5.w),
                            ),
                            child: Center(
                              child: Text(
                                'Durasi',
                                style: getTextStyle(
                                  FontSizeManager.f16,
                                  FontFamilyConstant.fontFamily,
                                  FontWeightManager.semiBold,
                                  ColorManager.whiteC,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 50.w,
                                  height: 50.w,
                                  margin:
                                      const EdgeInsets.only(top: 5, right: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorManager.primaryLight
                                          .withOpacity(0.2),
                                    ),
                                    color: ColorManager.greyLightC,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '10',
                                      style: getTextStyle(
                                        FontSizeManager.f22,
                                        FontFamilyConstant.fontFamily,
                                        FontWeightManager.bold,
                                        ColorManager.blackC,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Min',
                                  style: getTextStyle(
                                    FontSizeManager.f20,
                                    FontFamilyConstant.fontFamily,
                                    FontWeightManager.semiBold,
                                    ColorManager.blackC,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 40.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        elevation: 10.w,
                        backgroundColor: ColorManager.primaryLight,
                        shadowColor: ColorManager.primaryLight),
                    onPressed: () {},
                    child: Text(
                      'Simpan',
                      style: getTextStyle(
                        FontSizeManager.f16,
                        FontFamilyConstant.fontFamily,
                        FontWeightManager.semiBold,
                        ColorManager.whiteC,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Sore',
            style: getTextStyle(
              FontSizeManager.f18,
              FontFamilyConstant.fontFamily,
              FontWeightManager.bold,
              ColorManager.blackC,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30.h),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: ColorManager.primaryLight,
                width: 2,
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 7.h),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(5.w),
                            ),
                            child: Center(
                              child: Text(
                                'Waktu',
                                style: getTextStyle(
                                  FontSizeManager.f16,
                                  FontFamilyConstant.fontFamily,
                                  FontWeightManager.semiBold,
                                  ColorManager.whiteC,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 14.h,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 50.w,
                                        height: 50.w,
                                        margin: const EdgeInsets.only(
                                            top: 5, right: 7),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: ColorManager.greyC
                                                .withOpacity(0.2),
                                          ),
                                          color: ColorManager.greyLightC,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                            child: Text(
                                          '16',
                                          style: getTextStyle(
                                            FontSizeManager.f22,
                                            FontFamilyConstant.fontFamily,
                                            FontWeightManager.bold,
                                            ColorManager.blackC,
                                          ),
                                        )),
                                      ),
                                      Text(
                                        ':',
                                        style: getTextStyle(
                                          FontSizeManager.f28,
                                          FontFamilyConstant.fontFamily,
                                          FontWeight.bold,
                                          ColorManager.blackC,
                                        ),
                                      ),
                                      Container(
                                        width: 50.w,
                                        height: 50.w,
                                        margin: const EdgeInsets.only(
                                            top: 5, left: 7),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: ColorManager.greyC
                                                .withOpacity(0.2),
                                          ),
                                          color: ColorManager.greyLightC,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                            child: Text(
                                          '00',
                                          style: getTextStyle(
                                            FontSizeManager.f22,
                                            FontFamilyConstant.fontFamily,
                                            FontWeightManager.bold,
                                            ColorManager.blackC,
                                          ),
                                        )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 7.h),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(5.w),
                            ),
                            child: Center(
                              child: Text(
                                'Durasi',
                                style: getTextStyle(
                                  FontSizeManager.f16,
                                  FontFamilyConstant.fontFamily,
                                  FontWeightManager.semiBold,
                                  ColorManager.whiteC,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 50.w,
                                  height: 50.w,
                                  margin:
                                      const EdgeInsets.only(top: 5, right: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorManager.primaryLight
                                          .withOpacity(0.2),
                                    ),
                                    color: ColorManager.greyLightC,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '10',
                                      style: getTextStyle(
                                        FontSizeManager.f22,
                                        FontFamilyConstant.fontFamily,
                                        FontWeightManager.bold,
                                        ColorManager.blackC,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Min',
                                  style: getTextStyle(
                                    FontSizeManager.f20,
                                    FontFamilyConstant.fontFamily,
                                    FontWeightManager.semiBold,
                                    ColorManager.blackC,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 40.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        elevation: 10.w,
                        backgroundColor: ColorManager.primaryLight,
                        shadowColor: ColorManager.primaryLight),
                    onPressed: () {},
                    child: Text(
                      'Simpan',
                      style: getTextStyle(
                        FontSizeManager.f16,
                        FontFamilyConstant.fontFamily,
                        FontWeightManager.semiBold,
                        ColorManager.whiteC,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
