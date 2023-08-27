import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipunggur_app/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sipunggur_app/src/features/auth/presentation/login_screen.dart';
import 'package:sipunggur_app/src/features/devices/presentation/bloc/change_page_bloc.dart';
import 'package:sipunggur_app/src/features/devices/presentation/bloc/device_bloc.dart';
import 'package:sipunggur_app/src/features/devices/presentation/bloc/monitoring_bloc.dart';
import 'package:sipunggur_app/src/features/devices/presentation/main_screen.dart';
import 'package:sipunggur_app/src/features/log/presentation/bloc/log_bloc.dart';
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
        BlocProvider(
          create: (context) => ChangePageBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => DeviceBloc(),
        ),
        BlocProvider(
          create: (context) => MonitoringBloc(),
        ),
        BlocProvider(
          create: (context) => LogBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationThemeData(),
        routes: {
          SplashScreen.splashPath: (context) => SplashScreen(),
          OnBoardingScreen.onboardingPath: (context) => OnBoardingScreen(),
          LoginScreen.loginPath: (context) => LoginScreen(),
          MainScreen.mainPath: (context) => MainScreen(),
        },
      ),
    );
  }
}
