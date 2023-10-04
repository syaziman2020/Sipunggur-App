import 'dart:async';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sipunggur_app/src/common_widgets/tile_drawer.dart';
import 'package:sipunggur_app/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sipunggur_app/src/features/auth/presentation/profile_screen.dart';
import 'package:sipunggur_app/src/features/devices/domain/monitoring_model.dart';
import 'package:sipunggur_app/src/features/devices/presentation/bloc/change_page_bloc.dart';
import 'package:sipunggur_app/src/features/devices/presentation/bloc/device_bloc.dart';
import 'package:sipunggur_app/src/features/devices/presentation/bloc/monitoring_bloc.dart';
import 'package:sipunggur_app/src/features/devices/presentation/scaner_screen.dart';

import 'package:sipunggur_app/src/features/log/presentation/schedule_scree.dart.dart';
import 'package:sipunggur_app/src/features/log/presentation/log_screen.dart';
import 'package:sipunggur_app/src/features/on_boarding/presentation/bloc/carousel_onboarding_bloc.dart';
import 'package:sipunggur_app/src/features/on_boarding/presentation/on_boarding_screen.dart';
import 'package:sipunggur_app/src/theme_manager/color_manager.dart';
import 'package:sipunggur_app/src/theme_manager/font_manager.dart';
import 'package:sipunggur_app/src/theme_manager/style_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String mainPath = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Timer _periodicTime;
  CarouselController carouselController = CarouselController();
  TextEditingController changeC = TextEditingController();
  bool edit = false;

  @override
  void initState() {
    context.read<AuthBloc>().add(ProfileEvent());
    context.read<DeviceBloc>().add(ControlEvent());
    context.read<MonitoringBloc>().add(MonitoringEventFirst());
    init();
    super.initState();
  }

  void init() async {
    // Delay for 30 seconds
    await Future.delayed(Duration(seconds: 30));

    // Check if the widget is still mounted before setting up the periodic timer
    if (mounted) {
      _periodicTime = Timer.periodic(Duration(seconds: 30), (timer) {
        // Check if the widget is still mounted before accessing the context
        if (mounted) {
          context.read<DeviceBloc>().add(ControlEventPeriodic());
          context.read<MonitoringBloc>().add(MonitoringEventPeriodic());
          print("GetData");
        }
      });
    }
  }

  @override
  void dispose() async {
    init();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget headerDrawer() {
      return Container(
        padding: const EdgeInsets.only(
          left: 24,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.primaryLight,
        ),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: FadeInImage(
                    width: 52.w,
                    height: 52.w,
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/images/no_person.jpg'),
                    image: AssetImage('assets/images/no_person.jpg'),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  (state is ProfileLoading)
                      ? 'Loading...'
                      : (state is ProfileSuccess)
                          ? state.profileModel.data?.name ?? ''
                          : '',
                  style: getTextStyle(
                    FontSizeManager.f16,
                    FontFamilyConstant.fontFamily,
                    FontWeightManager.semiBold,
                    ColorManager.whiteC,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/mail_icon.svg',
                      width: 14.w,
                      fit: BoxFit.cover,
                      color: ColorManager.whiteC,
                    ),
                    SizedBox(
                      width: 5.w,
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
                        FontWeightManager.regular,
                        ColorManager.whiteC,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
              ],
            );
          },
        ),
      );
    }

    Widget listFeature() {
      return BlocBuilder<ChangePageBloc, int>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 21.h,
              ),
              TileDrawer(
                onTap: () {
                  context.read<ChangePageBloc>().add(ChangeIndexEvent(0));
                },
                urlImage: 'assets/icons/dashboard_icon.svg',
                title: 'Dashboard',
                color: (state == 0)
                    ? ColorManager.primary
                    : const Color(0xff8A899C),
              ),
              TileDrawer(
                onTap: () {
                  context.read<ChangePageBloc>().add(ChangeIndexEvent(1));
                },
                urlImage: 'assets/icons/log_icon.svg',
                title: 'Log Data',
                color: (state == 1)
                    ? ColorManager.primary
                    : const Color(0xff8A899C),
              ),
              TileDrawer(
                onTap: () {},
                urlImage: 'assets/icons/device_icon.svg',
                title: 'Add Device',
                color: (state == 2)
                    ? ColorManager.primary
                    : const Color(0xff8A899C),
              ),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) async {
                  if (state is LogoutFailed) {
                    print('fail');
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
                    Navigator.of(context, rootNavigator: true).pop();
                    context
                        .read<CarouselOnboardingBloc>()
                        .add(ChangeContentEvent(0));
                    Navigator.pushNamedAndRemoveUntil(context,
                        OnBoardingScreen.onboardingPath, (route) => false);
                  }
                },
                builder: (context, state) {
                  if (state is LogoutLoading) {
                    return TileDrawer(
                      onTap: () {},
                      urlImage: 'assets/icons/logout_icon.svg',
                      title: 'Loading...',
                    );
                  }
                  return TileDrawer(
                    onTap: () {
                      context.read<AuthBloc>().add(LogoutEvent());
                    },
                    urlImage: 'assets/icons/logout_icon.svg',
                    title: 'Logout',
                  );
                },
              ),
            ],
          );
        },
      );
    }

    Widget dahsboard() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  decoration: BoxDecoration(
                    color: ColorManager.whiteC,
                    borderRadius: BorderRadius.circular(20.w),
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.primary.withOpacity(0.2),
                        offset: Offset(0, 5),
                        blurRadius: 20,
                      )
                    ],
                  ),
                  width: double.infinity,
                  height: 150.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.only(left: 14.w, top: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlocBuilder<DeviceBloc, DeviceState>(
                                builder: (context, state) {
                                  if (state is ControlSuccess) {
                                    return Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Temperatur ',
                                            style: getTextStyle(
                                              FontSizeManager.f18,
                                              FontFamilyConstant.fontFamily,
                                              FontWeightManager.regular,
                                              ColorManager.blackC,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                '${state.controlModel.data?.humidityTemperature?.temperature ?? 0}°C',
                                            style: getTextStyle(
                                              FontSizeManager.f18,
                                              FontFamilyConstant.fontFamily,
                                              FontWeightManager.bold,
                                              ColorManager.blackC,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  return Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Temperatur ',
                                          style: getTextStyle(
                                            FontSizeManager.f18,
                                            FontFamilyConstant.fontFamily,
                                            FontWeightManager.regular,
                                            ColorManager.blackC,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '...°C',
                                          style: getTextStyle(
                                            FontSizeManager.f18,
                                            FontFamilyConstant.fontFamily,
                                            FontWeightManager.bold,
                                            ColorManager.blackC,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/humidity_icon.svg',
                                  ),
                                  const SizedBox(width: 3),
                                  BlocBuilder<DeviceBloc, DeviceState>(
                                    builder: (context, state) {
                                      if (state is ControlSuccess) {
                                        return Text(
                                          'Kelemban Udara ${state.controlModel.data?.humidityTemperature?.humidity ?? 0} RH',
                                          style: getTextStyle(
                                            FontSizeManager.f16,
                                            FontFamilyConstant.fontFamily,
                                            FontWeightManager.regular,
                                            ColorManager.blackC,
                                          ),
                                        );
                                      }
                                      return Text(
                                        'Kelemban Udara ...y RH',
                                        style: getTextStyle(
                                          FontSizeManager.f16,
                                          FontFamilyConstant.fontFamily,
                                          FontWeightManager.regular,
                                          ColorManager.blackC,
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Image.asset(
                          'assets/images/logo_sipunggur.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Kelembapan Tanah',
                  style: getTextStyle(
                    FontSizeManager.f16,
                    FontFamilyConstant.fontFamily,
                    FontWeightManager.semiBold,
                    ColorManager.blackC,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          BlocConsumer<MonitoringBloc, MonitoringState>(
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
                return CarouselSlider(
                  items: [
                    if (state.monitoringModel.data != null) ...{
                      if (state.monitoringModel.data!.isNotEmpty) ...{
                        ...state.monitoringModel.data!.map(
                          (e) {
                            return GridView.count(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisSpacing: 50.w,
                              mainAxisSpacing: 30.h,
                              crossAxisCount: 2,
                              children: [
                                if (e.sensor != null ||
                                    e.sensor!.isNotEmpty) ...{
                                  ...e.sensor!.map((f) {
                                    return GestureDetector(
                                      onTap: () {
                                        dialogPot(context, f);
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            'assets/images/pot_new.png',
                                            width: 110.w,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            '${f.sensorName}',
                                            style: getTextStyle(
                                              FontSizeManager.f16,
                                              FontFamilyConstant.fontFamily,
                                              FontWeightManager.regular,
                                              ColorManager.blackC,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  })
                                },
                              ],
                            );
                          },
                        ),
                      } else ...{
                        SizedBox(),
                      }
                    } else ...{
                      SizedBox(),
                    }
                  ],
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    aspectRatio: 1,
                  ),
                );
              } else if (state is MonitoringLoading) {
                return SizedBox();
              }
              return SizedBox();
            },
          ),
        ],
      );
    }

    Widget content(int index) {
      switch (index) {
        case 0:
          return dahsboard();
        case 1:
          return LogScreen();
        case 2:
          return ScheduleScreen();
        case 3:
          return ProfileScreen();
        default:
          return dahsboard();
      }
    }

    Widget floatingAction() {
      return FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        elevation: 0,
        backgroundColor: ColorManager.primaryLight,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScanerScreen(),
            ),
          );
        },
        child: Icon(
          Icons.qr_code_scanner,
          color: ColorManager.whiteC,
        ),
      );
    }

    Widget bottomNavbar() {
      return Container(
        height: 58,
        decoration: BoxDecoration(
          color: ColorManager.whiteC,
          boxShadow: [
            BoxShadow(
              color: ColorManager.primaryLight.withOpacity(0.5),
              offset: Offset(0, 0),
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: BlocBuilder<ChangePageBloc, int>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<ChangePageBloc>().add(ChangeIndexEvent(0));
                    },
                    icon: Icon(
                      Icons.home,
                      size: 24.w,
                      color: (state == 0)
                          ? ColorManager.primaryLight
                          : ColorManager.greyNavbar,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<ChangePageBloc>().add(ChangeIndexEvent(1));
                    },
                    icon: Icon(
                      Icons.format_list_bulleted,
                      size: 24.w,
                      color: (state == 1)
                          ? ColorManager.primaryLight
                          : ColorManager.greyNavbar,
                    ),
                  ),
                  const SizedBox(),
                  IconButton(
                    onPressed: () {
                      context.read<ChangePageBloc>().add(ChangeIndexEvent(2));
                    },
                    icon: Icon(
                      Icons.schedule,
                      size: 24.w,
                      color: (state == 2)
                          ? ColorManager.primaryLight
                          : ColorManager.greyNavbar,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<ChangePageBloc>().add(ChangeIndexEvent(3));
                    },
                    icon: Icon(
                      Icons.person,
                      size: 24.w,
                      color: (state == 3)
                          ? ColorManager.primaryLight
                          : ColorManager.greyNavbar,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    }

    PreferredSizeWidget appbar() {
      return PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            top: 10.h,
          ),
          child: AppBar(
            surfaceTintColor: ColorManager.whiteC,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50.w),
              child: Image.asset(
                'assets/images/blank_person.png',
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return Text(
                      'Halo ${(state is ProfileSuccess) ? state.profileModel.data?.name ?? '...' : '...'}',
                      style: getTextStyle(
                        FontSizeManager.f18,
                        FontFamilyConstant.fontFamily,
                        FontWeightManager.bold,
                        ColorManager.blackC,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  'Selamat Pagi',
                  style: getTextStyle(
                    FontSizeManager.f14,
                    FontFamilyConstant.fontFamily,
                    FontWeightManager.medium,
                    ColorManager.greyC,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: BlocBuilder<ChangePageBloc, int>(
        builder: (context, state) {
          return Scaffold(
            appBar: (state == 0 || state == 1 || state == 2) ? appbar() : null,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            backgroundColor: ColorManager.whiteC,
            floatingActionButton: floatingAction(),
            bottomNavigationBar: bottomNavbar(),
            body: BlocBuilder<ChangePageBloc, int>(
              builder: (context, state) {
                return SingleChildScrollView(
                  child: content(state),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> dialogPot(BuildContext context, Sensor f) {
    changeC.text = f.sensorName ?? '...';
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          titlePadding: EdgeInsets.only(bottom: 10.h, top: 20.h),
          backgroundColor: ColorManager.whiteC,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 200.w,
                  height: 45.h,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: getTextStyle(
                      FontSizeManager.f22,
                      FontFamilyConstant.fontFamily,
                      FontWeightManager.semiBold,
                      ColorManager.blackC,
                    ),
                    enabled: edit,
                    controller: changeC,
                    textInputAction: TextInputAction.done,
                    cursorColor: ColorManager.primaryLight,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintStyle: getTextStyle(
                        FontSizeManager.f15,
                        FontFamilyConstant.fontFamily,
                        FontWeightManager.regular,
                        ColorManager.greyDarkC,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                        borderSide:
                            BorderSide(color: ColorManager.primaryLight),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                        borderSide: BorderSide(
                          color: ColorManager.primaryLight,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        edit = !edit;
                      });
                    },
                    icon: const Icon(
                      Icons.edit,
                      size: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/soil_icon.svg',
                width: 32.w,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                '${f.soilMoisture ?? 0}%',
                style: getTextStyle(
                  FontSizeManager.f30,
                  FontFamilyConstant.fontFamily,
                  FontWeightManager.bold,
                  ColorManager.blackC,
                ),
              )
            ],
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 10.w),
                  elevation: 10.w,
                  backgroundColor: ColorManager.primaryLight,
                  shadowColor: ColorManager.primaryLight,
                ),
                child: Text(
                  'Oke',
                  style: getTextStyle(
                    FontSizeManager.f14,
                    FontFamilyConstant.fontFamily,
                    FontWeightManager.semiBold,
                    ColorManager.whiteC,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
