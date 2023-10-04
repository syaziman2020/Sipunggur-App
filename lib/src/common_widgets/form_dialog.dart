import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../theme_manager/color_manager.dart';
import '../theme_manager/font_manager.dart';
import '../theme_manager/style_manager.dart';

class FormDialog extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscure;
  final TextInputAction action;
  final String iconPath;

  Function(String value) onSubmit;

  FormDialog(
      {super.key,
      required this.controller,
      required this.hintText,
      this.obscure = false,
      this.action = TextInputAction.next,
      required this.iconPath,
      required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onSubmit,
      controller: controller,
      textInputAction: action,
      cursorColor: ColorManager.primaryLight,
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 20.w,
                color: ColorManager.primaryLight,
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                ),
                height: 30.w,
                width: 1.h,
                color: controller.selection.baseOffset > 0
                    ? ColorManager.primaryLight
                    : ColorManager.primary,
              )
            ],
          ),
        ),
        
        contentPadding: const EdgeInsets.all(14),
        hintText: hintText,
        hintStyle: getTextStyle(
          FontSizeManager.f15,
          FontFamilyConstant.fontFamily,
          FontWeightManager.regular,
          ColorManager.greyDarkC,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
          borderSide: BorderSide(color: ColorManager.primaryLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
          borderSide: BorderSide(
            color: ColorManager.primaryLight,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
