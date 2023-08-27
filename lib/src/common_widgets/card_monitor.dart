import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipunggur_app/src/features/devices/presentation/bloc/monitoring_bloc.dart';
import '../theme_manager/color_manager.dart';
import '../theme_manager/font_manager.dart';
import '../theme_manager/style_manager.dart';

class CardMonitor extends StatelessWidget {
  const CardMonitor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MonitoringBloc, MonitoringState>(
      listener: (context, state) {
        if (state is MonitoringFailed) {
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
        if (state is MonitoringSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (state.monitoringModel.data != null ||
                  state.monitoringModel.data!.isNotEmpty) ...{
                ...state.monitoringModel.data!.map(
                  (e) {
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
                            '${e.nodeName ?? ''}',
                            style: getTextStyle(
                              FontSizeManager.f16,
                              FontFamilyConstant.fontFamily,
                              FontWeightManager.semiBold,
                              ColorManager.whiteC,
                            ),
                          ),
                          if (e.sensor != null || e.sensor!.isNotEmpty) ...{
                            ...e.sensor!.map((f) {
                              return Padding(
                                padding: EdgeInsets.only(top: 14.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          '${f.sensorName}',
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
                                      '${f.soilMoisture ?? 0}%',
                                      style: getTextStyle(
                                        FontSizeManager.f18,
                                        FontFamilyConstant.fontFamily,
                                        FontWeightManager.semiBold,
                                        ColorManager.whiteC,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          }
                        ],
                      ),
                    );
                  },
                ),
              }
            ],
          );
        } else if (state is MonitoringLoading) {
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
                  'Loading...',
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
                          'Loading...',
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
                      '...%',
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
                          'Loading...',
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
                      '...%',
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
                          'Loading...',
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
                      '...%',
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
                          'Loading...',
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
                      '...%',
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
        return SizedBox();
      },
    );
  }
}
