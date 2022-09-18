// ignore_for_file: sort_child_properties_last

import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOutlineTextButton extends StatelessWidget {
  const CustomOutlineTextButton({
    Key? key,
    required this.buttonText,
    this.buttonTextStyle,
    this.fixedSize,
    required this.onPressed,
  }) : super(key: key);

  final String buttonText;
  final TextStyle? buttonTextStyle;
  final Size? fixedSize;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(buttonText,
              style: buttonTextStyle ??
                  AppTextStyle().getSfProDisplayRegular_H5(AppColors.ORANGE)),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(color: AppColors.ORANGE),
            ),
          ),
          fixedSize: MaterialStateProperty.all<Size>(
            fixedSize ?? Size(290.w, 35.h),
          ),
        ),
        onPressed: onPressed);
  }
}
