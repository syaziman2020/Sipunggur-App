import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sipunggur_app/src/common_widgets/card_log.dart';
import 'package:sipunggur_app/src/features/log/presentation/bloc/log_bloc.dart';
import 'package:sipunggur_app/src/theme_manager/color_manager.dart';
import 'package:sipunggur_app/src/theme_manager/font_manager.dart';
import 'package:sipunggur_app/src/theme_manager/style_manager.dart';

class LogScreen extends StatelessWidget {
  const LogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: RefreshIndicator(
        displacement: 100.h,
        color: ColorManager.primaryLight,
        backgroundColor: ColorManager.whiteC,
        onRefresh: () async {
          context.read<LogBloc>().add(LogEventData());
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.w,
              ),
              Text(
                'Log Data',
                style: getTextStyle(
                  FontSizeManager.f18,
                  FontFamilyConstant.fontFamily,
                  FontWeightManager.bold,
                  ColorManager.blackC,
                ),
              ),
              CardLog(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}