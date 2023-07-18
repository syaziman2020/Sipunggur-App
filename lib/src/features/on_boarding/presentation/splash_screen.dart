import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sipunggur_app/src/features/on_boarding/presentation/on_boarding_screen.dart';
import 'package:sipunggur_app/src/theme_manager/color_manager.dart';

class SplashScreen extends StatefulWidget {
  static const String splashPath = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 2500), () {
      Navigator.pushReplacementNamed(context, OnBoardingScreen.onboardingPath);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xff41D880).withOpacity(0.7),
              ColorManager.whiteC,
              ColorManager.whiteC,
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/logo_sipunggur.png',
            width: 158.w,
          ),
        ),
      ),
    );
  }
}
