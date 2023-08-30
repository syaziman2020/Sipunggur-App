import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sipunggur_app/src/common_widgets/card_control.dart';
import 'package:sipunggur_app/src/common_widgets/card_monitor.dart';
import 'package:sipunggur_app/src/common_widgets/tile_drawer.dart';
import 'package:sipunggur_app/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sipunggur_app/src/features/devices/presentation/bloc/change_page_bloc.dart';
import 'package:sipunggur_app/src/features/devices/presentation/bloc/device_bloc.dart';
import 'package:sipunggur_app/src/features/devices/presentation/bloc/monitoring_bloc.dart';
import 'package:sipunggur_app/src/features/log/presentation/bloc/log_bloc.dart';
import 'package:sipunggur_app/src/features/log/presentation/graphic_screen.dart';
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
                    placeholder: AssetImage('assets/images/profile.png'),
                    image: AssetImage('assets/images/profile.png'),
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
                onTap: () {
                  // context.read<ChangePageBloc>().add(ChangeIndexEvent(2));
                },
                urlImage: 'assets/icons/graph_icon.svg',
                title: 'Graphic',
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

    SliverAppBar sliverAppBar() {
      return SliverAppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        pinned: false,
        snap: true,
        floating: true,
        expandedHeight: 280.h,
        flexibleSpace: FlexibleSpaceBar(
          background: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<DeviceBloc, DeviceState>(
                  builder: (context, state) {
                    return Text(
                      (state is ControlSuccess)
                          ? '${state.controlModel.data!.humidityTemperature!.temperature ?? 0}°C'
                          : '...°C',
                      style: getTextStyle(
                        70.w,
                        FontFamilyConstant.fontFamily,
                        FontWeightManager.bold,
                        ColorManager.blackC,
                      ).copyWith(height: 0),
                    );
                  },
                ),
                BlocBuilder<DeviceBloc, DeviceState>(
                  builder: (context, state) {
                    return Text(
                      'Kelembapan ${(state is ControlSuccess) ? '${state.controlModel.data!.humidityTemperature!.humidity ?? 0}' : '...'}%',
                      style: getTextStyle(
                        FontSizeManager.f20,
                        FontFamilyConstant.fontFamily,
                        FontWeightManager.semiBold,
                        ColorManager.blackC,
                      ).copyWith(height: 0),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget dahsboard() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardControl(),
          CardMonitor(),
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
          return GraphicScreen();
        default:
          return dahsboard();
      }
    }

    return SafeArea(
      child: BlocBuilder<ChangePageBloc, int>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              color: ColorManager.whiteC,
              image: (state == 0)
                  ? const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/bg_3_resize.jpg',
                      ),
                    )
                  : null,
            ),
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(56.h),
                child: BlocBuilder<ChangePageBloc, int>(
                  builder: (context, state) {
                    return AppBar(
                      actions: [
                        if (state == 1) ...{
                          BlocBuilder<LogBloc, LogState>(
                            builder: (context, state) {
                              if (state is LogLoading) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 14.w),
                                  child: SizedBox(
                                    width: 20.w,
                                    height: 20.h,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 3,
                                      color: ColorManager.whiteC,
                                    ),
                                  ),
                                );
                              }
                              return IconButton(
                                onPressed: () {
                                  context.read<LogBloc>().add(LogEventData());
                                },
                                icon: const Icon(
                                  Icons.autorenew,
                                ),
                              );
                            },
                          )
                        }
                      ],
                      iconTheme: IconThemeData(color: ColorManager.whiteC),
                      backgroundColor: (state == 0)
                          ? ColorManager.blackC.withOpacity(0.3)
                          : ColorManager.primaryLight,
                      title: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is ProfileFailed) {
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
                          return Text(
                            (state is ProfileLoading)
                                ? 'Loading'
                                : (state is ProfileSuccess)
                                    ? state.profileModel.data?.name ?? ''
                                    : '',
                            style: getTextStyle(
                              20.w,
                              FontFamilyConstant.fontFamily,
                              FontWeightManager.semiBold,
                              ColorManager.whiteC,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              backgroundColor: Colors.transparent,
              body: BlocBuilder<ChangePageBloc, int>(
                builder: (context, state) {
                  return CustomScrollView(
                    slivers: [
                      if (state == 0) ...{
                        sliverAppBar(),
                      },
                      SliverList.list(children: [
                        content(state),
                      ]),
                    ],
                  );
                },
              ),
              drawer: Drawer(
                backgroundColor: ColorManager.whiteC,
                surfaceTintColor: ColorManager.whiteC,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(0),
                      bottomRight: Radius.circular(0)),
                ),
                child: Column(
                  children: [
                    headerDrawer(),
                    listFeature(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
