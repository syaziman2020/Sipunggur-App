import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sipunggur_app/src/features/devices/domain/control_model.dart';
import 'package:sipunggur_app/src/features/devices/presentation/bloc/device_bloc.dart';

import '../theme_manager/color_manager.dart';
import '../theme_manager/font_manager.dart';
import '../theme_manager/style_manager.dart';

class CardControl extends StatefulWidget {
  CardControl({
    super.key,
    // required this.name,
    // required this.relays,
  });

  @override
  State<CardControl> createState() => _CardControlState();
}

class _CardControlState extends State<CardControl> {
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
          BlocConsumer<DeviceBloc, DeviceState>(
            listener: (context, state) {
              if (state is ControlFailed) {
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
              if (state is ControlSuccess) {
                return Text(
                  state.controlModel.data?.name ?? '',
                  style: getTextStyle(
                    FontSizeManager.f16,
                    FontFamilyConstant.fontFamily,
                    FontWeightManager.semiBold,
                    ColorManager.whiteC,
                  ),
                );
              } else if (state is ControlLoading) {
                Text(
                  'Loading...',
                  style: getTextStyle(
                    FontSizeManager.f16,
                    FontFamilyConstant.fontFamily,
                    FontWeightManager.semiBold,
                    ColorManager.whiteC,
                  ),
                );
              }
              return Text(
                'Loading...',
                style: getTextStyle(
                  FontSizeManager.f16,
                  FontFamilyConstant.fontFamily,
                  FontWeightManager.semiBold,
                  ColorManager.whiteC,
                ),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          BlocConsumer<DeviceBloc, DeviceState>(
            builder: (context, state) {
              if (state is ControlLoading) {
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                              '...',
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
                  ],
                );
              } else if (state is ControlSuccess) {
                if (state.controlModel.data!.relay != null ||
                    state.controlModel.data!.relay!.isNotEmpty) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...state.controlModel.data!.relay!.map((e) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
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
                                      e.name ?? '',
                                      style: getTextStyle(
                                        FontSizeManager.f15,
                                        FontFamilyConstant.fontFamily,
                                        FontWeightManager.regular,
                                        ColorManager.whiteC,
                                      ),
                                    ),
                                  ],
                                ),
                                (e.status?.toLowerCase() == 'on')
                                    ? Container(
                                        width: 60.w,
                                        padding: EdgeInsets.symmetric(
                                          vertical: 4.w,
                                        ),
                                        decoration: BoxDecoration(
                                          color: ColorManager.primaryLight,
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                      )
                                    : Container(
                                        width: 60.w,
                                        padding: EdgeInsets.symmetric(
                                          vertical: 4.w,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                            const SizedBox(
                              height: 14,
                            ),
                          ],
                        );
                      }),
                    ],
                  );
                }
                return Center(
                  child: Text(
                    'Data Kosong',
                    style: getTextStyle(
                      FontSizeManager.f16,
                      FontFamilyConstant.fontFamily,
                      FontWeightManager.semiBold,
                      ColorManager.whiteC,
                    ),
                  ),
                );
              }
              return SizedBox();
            },
            listener: (context, state) {
              if (state is ControlFailed) {
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
          )
        ],
      ),
    );
  }
}
