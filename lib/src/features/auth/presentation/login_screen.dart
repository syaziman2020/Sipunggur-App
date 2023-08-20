import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sipunggur_app/src/common_widgets/custom_button.dart';
import 'package:sipunggur_app/src/common_widgets/custom_textfield.dart';
import 'package:sipunggur_app/src/features/devices/presentation/main_screen.dart';
import 'package:sipunggur_app/src/theme_manager/color_manager.dart';
import 'package:sipunggur_app/src/theme_manager/font_manager.dart';
import 'package:sipunggur_app/src/theme_manager/style_manager.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static const String loginPath = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  @override
  void initState() {
    super.initState();
    emailC.addListener(() {
      setState(() {});
    });
    passC.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    emailC.dispose();
    passC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: 50.w,
              ),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 22.h),
                      width: 224.w,
                      height: 8.w,
                      decoration: BoxDecoration(
                        color: ColorManager.greyLightC,
                      ),
                    ),
                    Text(
                      'Sipunggur for grapes',
                      style: getTextStyle(
                        FontSizeManager.f24,
                        FontFamilyConstant.fontFamily,
                        FontWeightManager.bold,
                        ColorManager.blackC,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 88.h),
              height: 240.h,
              width: double.infinity,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 14.h),
                    child: Image.asset(
                      'assets/images/line_dash.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 190.w,
                        height: 190.w,
                        margin: EdgeInsets.only(
                          left: 30.w,
                          top: 20,
                        ),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/primary_login.png',
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 67.w,
                            height: 67.w,
                            margin: EdgeInsets.only(
                              left: 8.w,
                            ),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/secondary_login.png',
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 70.w,
                              height: 70.w,
                              margin: EdgeInsets.only(
                                left: 42.w,
                                bottom: 30.h,
                              ),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/third_login.png',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign In',
                    style: getTextStyle(
                      FontSizeManager.f18,
                      FontFamilyConstant.fontFamily,
                      FontWeightManager.bold,
                      ColorManager.blackC,
                    ),
                  ),
                  SizedBox(
                    height: 18.w,
                  ),
                  CustomTextField(
                    controller: emailC,
                    hintText: 'Email Address',
                    iconPath: 'assets/icons/mail_icon.svg',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextField(
                    controller: emailC,
                    hintText: 'Password',
                    iconPath: 'assets/icons/lock_icon.svg',
                    obscure: false,
                    action: TextInputAction.done,
                  ),
                  SizedBox(
                    height: 90.h,
                  ),
                  CustomButton(
                      onTap: () {
                        Navigator.pushNamed(context, MainScreen.mainPath);
                      },
                      title: 'Sign In Now')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
