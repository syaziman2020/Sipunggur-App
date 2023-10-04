import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sipunggur_app/src/common_widgets/tile_setting.dart';
import 'package:sipunggur_app/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sipunggur_app/src/features/on_boarding/presentation/on_boarding_screen.dart';
import 'package:sipunggur_app/src/theme_manager/color_manager.dart';
import 'package:sipunggur_app/src/theme_manager/font_manager.dart';
import 'package:sipunggur_app/src/theme_manager/style_manager.dart';

import '../../../common_widgets/form_dialog.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  TextEditingController sensorC = TextEditingController();
  TextEditingController nodeC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.primaryLight.withOpacity(0.25),
                      offset: Offset(0, 20),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/blank_person.png',
                    width: 60.w,
                    height: 60.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        (state is ProfileLoading)
                            ? 'Loading...'
                            : (state is ProfileSuccess)
                                ? state.profileModel.data?.name ?? ''
                                : '',
                        style: getTextStyle(
                          FontSizeManager.f18,
                          FontFamilyConstant.fontFamily,
                          FontWeightManager.bold,
                          ColorManager.blackC,
                        ),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Text(
                        (state is ProfileLoading)
                            ? 'Loading...'
                            : (state is ProfileSuccess)
                                ? state.profileModel.data?.email ?? ''
                                : '',
                        style: getTextStyle(
                          FontSizeManager.f14,
                          FontFamilyConstant.fontFamily,
                          FontWeightManager.medium,
                          ColorManager.greyC,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          SizedBox(
            height: 30.h,
          ),
          Divider(
            color: ColorManager.primaryLight.withOpacity(0.2),
          ),
          SizedBox(
            height: 20.h,
          ),
          TileSetting(
            title: 'Data Pribadi',
            iconData: Icons.person,
            onTap: () {},
          ),
          TileSetting(
            title: 'Pengaturan',
            iconData: Icons.settings,
            onTap: () {},
          ),
          TileSetting(
            title: 'Tambah Perangkat',
            iconData: Icons.add_circle_outlined,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      titlePadding: EdgeInsets.only(bottom: 10.h, top: 20.h),
                      backgroundColor: ColorManager.whiteC,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      title: Center(
                        child: Text(
                          'Tambah Perangkat',
                          style: getTextStyle(
                            FontSizeManager.f20,
                            FontFamilyConstant.fontFamily,
                            FontWeightManager.semiBold,
                            ColorManager.blackC,
                          ),
                        ),
                      ),
                      content: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FormDialog(
                                controller: nodeC,
                                hintText: 'Kode Node',
                                iconPath: 'assets/icons/node_icon.svg',
                                onSubmit: (String value) {
                                  nodeC.text = value;
                                }),
                            SizedBox(
                              height: 20.w,
                            ),
                            FormDialog(
                                controller: sensorC,
                                hintText: 'Kode Sensor',
                                iconPath: 'assets/icons/sensor_icon.svg',
                                onSubmit: (String value) {
                                  sensorC.text = value;
                                }),
                          ],
                        ),
                      ),
                      actions: [
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 12.w),
                                    elevation: 5.w,
                                    backgroundColor: ColorManager.greyDarkC,
                                    shadowColor: ColorManager.greyDarkC,
                                  ),
                                  child: Text(
                                    'Batal',
                                    style: getTextStyle(
                                      FontSizeManager.f14,
                                      FontFamilyConstant.fontFamily,
                                      FontWeightManager.semiBold,
                                      ColorManager.whiteC,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 12.w),
                                    elevation: 5.w,
                                    backgroundColor: ColorManager.primaryLight,
                                    shadowColor: ColorManager.primaryLight,
                                  ),
                                  child: Text(
                                    'Tambah',
                                    style: getTextStyle(
                                      FontSizeManager.f14,
                                      FontFamilyConstant.fontFamily,
                                      FontWeightManager.semiBold,
                                      ColorManager.whiteC,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  });
            },
          ),
          TileSetting(
            title: 'Tentang',
            iconData: Icons.info,
            onTap: () {},
          ),
          SizedBox(
            height: 20.h,
          ),
          Divider(
            color: ColorManager.primaryLight.withOpacity(0.2),
          ),
          SizedBox(
            height: 20.h,
          ),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is LogoutFailed) {
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
              } else if (state is LogoutSuccess) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => OnBoardingScreen()),
                    (route) => false);
              }
            },
            builder: (context, state) {
              if (state is LogoutLoading) {
                return TileSetting(
                  title: 'Memuat...',
                  iconData: Icons.logout,
                  onTap: () {
                    context.read<AuthBloc>().add(LogoutEvent());
                  },
                );
              }
              return TileSetting(
                title: 'Keluar',
                iconData: Icons.logout,
                onTap: () {
                  context.read<AuthBloc>().add(LogoutEvent());
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
