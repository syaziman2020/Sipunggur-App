import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipunggur_app/src/features/on_boarding/presentation/bloc/carousel_onboarding_bloc.dart';
import 'package:sipunggur_app/src/features/on_boarding/presentation/on_boarding_screen.dart';
import 'package:sipunggur_app/src/features/on_boarding/presentation/splash_screen.dart';
import 'package:sipunggur_app/src/theme_manager/theme_data_manager.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CarouselOnboardingBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationThemeData(),
        routes: {
          SplashScreen.splashPath: (context) => SplashScreen(),
          OnBoardingScreen.onboardingPath: (context) => OnBoardingScreen(),
        },
      ),
    );
  }
}
