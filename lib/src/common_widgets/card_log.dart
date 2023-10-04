import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:sipunggur_app/src/features/log/presentation/bloc/log_bloc.dart';

import '../theme_manager/color_manager.dart';
import '../theme_manager/font_manager.dart';
import '../theme_manager/style_manager.dart';

class CardLog extends StatefulWidget {
  const CardLog({super.key});

  @override
  State<CardLog> createState() => _CardLogState();
}

class _CardLogState extends State<CardLog> {
  @override
  Widget build(BuildContext context) {
    Widget cardLog(String humidiy, String soil, String temp, String date,
        String time, String number) {
      return Container(
        margin: EdgeInsets.only(top: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorManager.secondary),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: ColorManager.primaryLight,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Center(
                child: Text(
                  number,
                  style: getTextStyle(
                    FontSizeManager.f16,
                    FontFamilyConstant.fontFamily,
                    FontWeightManager.bold,
                    ColorManager.whiteC,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
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
                            'Kelembapan Udara',
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
                        '$humidiy RH',
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
                            'Kelembapan Tanah',
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
                        '$soil%',
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
                            'Temperatur',
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
                        '$temp°C',
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
                        date,
                        style: getTextStyle(
                          FontSizeManager.f12,
                          FontFamilyConstant.fontFamily,
                          FontWeightManager.regular,
                          ColorManager.blackC,
                        ),
                      ),
                      Text(
                        '$time WIB',
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
            ),
          ],
        ),
      );
    }

    return BlocConsumer<LogBloc, LogState>(
      listener: (context, state) {
        if (state is LogFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                state.message,
                style: getTextStyle(
                  FontSizeManager.f14,
                  FontFamilyConstant.fontFamily,
                  FontWeightManager.medium,
                  ColorManager.whiteC,
                ),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is LogSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (state.logModel.data != null ||
                  state.logModel.data!.isNotEmpty) ...{
                ...state.logModel.data!.asMap().entries.map(
                  (e) {
                    return cardLog(
                        '${e.value.humidity ?? 0}',
                        '${e.value.soilMoisture ?? 0}',
                        '${e.value.temperature ?? 0}',
                        '${DateFormat('dd/MM/yyyy').format(
                          DateTime.parse(
                              e.value.time ?? DateTime.now().toString()),
                        )}',
                        '${'${DateFormat('HH:mm').format(
                          DateTime.parse(
                              e.value.time ?? DateTime.now().toString()),
                        )}'}',
                        '${e.key + 1}');
                  },
                ),
              }
            ],
          );
        } else if (state is LogLoading) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i <= 5; i++) ...{
                Container(
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
                            '...%',
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
                            '...%',
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
                            '...°C',
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
                            'loading...',
                            style: getTextStyle(
                              FontSizeManager.f12,
                              FontFamilyConstant.fontFamily,
                              FontWeightManager.regular,
                              ColorManager.blackC,
                            ),
                          ),
                          Text(
                            '... WIB',
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
                ),
              }
            ],
          );
        }
        return SizedBox();
      },
    );
  }
}
