import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sipunggur_app/src/common_widgets/card_control.dart';
import 'package:sipunggur_app/src/common_widgets/card_monitor.dart';
import 'package:sipunggur_app/src/common_widgets/tile_drawer.dart';
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
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 21.h,
          ),
          TileDrawer(
            onTap: () {},
            urlImage: 'assets/icons/dashboard_icon.svg',
            title: 'Dashboard',
            color: ColorManager.primary,
          ),
          TileDrawer(
            onTap: () {},
            urlImage: 'assets/icons/log_icon.svg',
            title: 'Log Data',
          ),
          TileDrawer(
            onTap: () {},
            urlImage: 'assets/icons/graph_icon.svg',
            title: 'Graphic',
          ),
          TileDrawer(
            onTap: () {},
            urlImage: 'assets/icons/logout_icon.svg',
            title: 'Logout',
          ),
        ],
      );
    }

    SliverAppBar sliverAppBar() {
      return SliverAppBar(
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
        title: Text(
          'Ziman',
          style: getTextStyle(
            20.w,
            FontFamilyConstant.fontFamily,
            FontWeightManager.bold,
            ColorManager.blackC,
          ),
        ),
      );
    }

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/bg_2.jpg',
            ),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              sliverAppBar(),
              SliverList.list(
                children: [
                  CardControl(),
                  CardMonitor(),
                ],
              )
            ],
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
      ),
    );
  }
}
