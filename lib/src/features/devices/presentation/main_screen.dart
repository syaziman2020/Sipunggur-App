import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sipunggur_app/src/common_widgets/card_control.dart';
import 'package:sipunggur_app/src/common_widgets/card_monitor.dart';
import 'package:sipunggur_app/src/common_widgets/tile_drawer.dart';
import 'package:sipunggur_app/src/features/devices/presentation/bloc/change_page_bloc.dart';
import 'package:sipunggur_app/src/features/log/graphic_screen.dart';
import 'package:sipunggur_app/src/features/log/log_screen.dart';
import 'package:sipunggur_app/src/theme_manager/color_manager.dart';
import 'package:sipunggur_app/src/theme_manager/font_manager.dart';
import 'package:sipunggur_app/src/theme_manager/style_manager.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static const String mainPath = '/main';

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
        child: Column(
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
              'Syaziman',
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
                  'syazimanuray@gmail.com',
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
                  context.read<ChangePageBloc>().add(ChangeIndexEvent(2));
                },
                urlImage: 'assets/icons/graph_icon.svg',
                title: 'Graphic',
                color: (state == 2)
                    ? ColorManager.primary
                    : const Color(0xff8A899C),
              ),
              TileDrawer(
                onTap: () {},
                urlImage: 'assets/icons/logout_icon.svg',
                title: 'Logout',
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
                Text(
                  '29°C',
                  style: getTextStyle(
                    70.w,
                    FontFamilyConstant.fontFamily,
                    FontWeightManager.bold,
                    ColorManager.blackC,
                  ).copyWith(height: 0),
                ),
                Text(
                  'Kelembapan 30%',
                  style: getTextStyle(
                    FontSizeManager.f20,
                    FontFamilyConstant.fontFamily,
                    FontWeightManager.semiBold,
                    ColorManager.blackC,
                  ).copyWith(height: 0),
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
        children: const [
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
                  ? DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/bg_3_resize.jpg',
                      ),
                    )
                  : null,
            ),
            child: Scaffold(
              appBar: PreferredSize(
                child: BlocBuilder<ChangePageBloc, int>(
                  builder: (context, state) {
                    return AppBar(
                      iconTheme: IconThemeData(color: ColorManager.whiteC),
                      backgroundColor: (state == 0)
                          ? ColorManager.blackC.withOpacity(0.3)
                          : ColorManager.primaryLight,
                      title: Text(
                        'Ziman',
                        style: getTextStyle(
                          20.w,
                          FontFamilyConstant.fontFamily,
                          FontWeightManager.semiBold,
                          ColorManager.whiteC,
                        ),
                      ),
                    );
                  },
                ),
                preferredSize: Size.fromHeight(56.h),
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
