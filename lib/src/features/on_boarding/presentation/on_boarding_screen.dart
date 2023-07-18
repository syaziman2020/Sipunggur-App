import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sipunggur_app/src/features/on_boarding/presentation/bloc/carousel_onboarding_bloc.dart';
import 'package:sipunggur_app/src/theme_manager/color_manager.dart';
import 'package:sipunggur_app/src/theme_manager/font_manager.dart';
import 'package:sipunggur_app/src/theme_manager/style_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sipunggur_app/src/utils/onboarding_util.dart';
import 'package:collection/collection.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String onboardingPath = '/onboarding';
  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget indicator(int index) {
      return BlocBuilder<CarouselOnboardingBloc, int>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 2.5),
            width: (state == index) ? 12.w : 10.w,
            height: (state == index) ? 12.w : 10.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (state == index)
                  ? ColorManager.primary
                  : ColorManager.secondary,
            ),
          );
        },
      );
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 90.h,
            ),
            Flexible(
              flex: 2,
              child: BlocBuilder<CarouselOnboardingBloc, int>(
                builder: (context, state) {
                  return CarouselSlider(
                    carouselController: carouselController,
                    items: contentCarousel
                        .map((e) => Image.asset(
                              e[0],
                            ))
                        .toList(),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      aspectRatio: 1.3,
                      initialPage: 0,
                      onPageChanged: (index, reason) {
                        context
                            .read<CarouselOnboardingBloc>()
                            .add(ChangeContentEvent(index));
                      },
                    ),
                  );
                },
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 80.w,
                  ),
                  BlocBuilder<CarouselOnboardingBloc, int>(
                    builder: (context, state) {
                      return Text(
                        (state == 0)
                            ? contentCarousel[0][1]
                            : (state == 1)
                                ? contentCarousel[1][1]
                                : contentCarousel[2][1],
                        style: getTextStyle(
                          FontSizeManager.f16,
                          FontFamilyConstant.fontFamily,
                          FontWeightManager.bold,
                          ColorManager.primary,
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  BlocBuilder<CarouselOnboardingBloc, int>(
                    builder: (context, state) {
                      print('=======');
                      print(state);
                      return Text(
                        (state == 0)
                            ? contentCarousel[0][2]
                            : (state == 1)
                                ? contentCarousel[1][2]
                                : contentCarousel[2][2],
                        textAlign: TextAlign.center,
                        style: getTextStyle(
                          FontSizeManager.f14,
                          FontFamilyConstant.fontFamily,
                          FontWeightManager.regular,
                          ColorManager.greyC,
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: BlocBuilder<CarouselOnboardingBloc, int>(
                  builder: (context, state) {
                    if (state == 2) {
                      return ElevatedButton(
                          onPressed: () {}, child: Text('Get Started'));
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            carouselController
                                .jumpToPage(contentCarousel.length - 1);
                          },
                          child: Text(
                            'Lewati',
                            style: getTextStyle(
                              FontSizeManager.f14,
                              FontFamilyConstant.fontFamily,
                              FontWeightManager.bold,
                              ColorManager.primary,
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Row(children: [
                            ...contentCarousel.mapIndexed(
                              (index, element) => indicator(index),
                            ),
                          ]),
                        ),
                        IconButton(
                          onPressed: () {
                            carouselController.nextPage();
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: ColorManager.primary,
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
