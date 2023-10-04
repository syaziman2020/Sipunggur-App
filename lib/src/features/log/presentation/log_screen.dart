import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sipunggur_app/src/common_widgets/card_log.dart';
import 'package:sipunggur_app/src/features/log/presentation/bloc/log_bloc.dart';
import 'package:sipunggur_app/src/theme_manager/color_manager.dart';
import 'package:sipunggur_app/src/theme_manager/font_manager.dart';
import 'package:sipunggur_app/src/theme_manager/style_manager.dart';

class LogScreen extends StatefulWidget {
  const LogScreen({super.key});

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  @override
  void initState() {
    context.read<LogBloc>().add(LogEventData());
    print('hehe');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.w,
            ),
            BlocBuilder<LogBloc, LogState>(builder: (context, state) {
              if (state is LogSuccess) {
                if (state.logModel.data!.isNotEmpty) {
                  return Text(
                    'Log Data (${state.logModel.data!.length})',
                    style: getTextStyle(
                      FontSizeManager.f18,
                      FontFamilyConstant.fontFamily,
                      FontWeightManager.bold,
                      ColorManager.blackC,
                    ),
                  );
                }
                return Text(
                  'Log Data (0)',
                  style: getTextStyle(
                    FontSizeManager.f18,
                    FontFamilyConstant.fontFamily,
                    FontWeightManager.bold,
                    ColorManager.blackC,
                  ),
                );
              }
              return Text(
                'Log Data (...)',
                style: getTextStyle(
                  FontSizeManager.f18,
                  FontFamilyConstant.fontFamily,
                  FontWeightManager.bold,
                  ColorManager.blackC,
                ),
              );
            }),
            CardLog(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
