import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  final Widget child;
  final Size? fixedSize;
  final EdgeInsetsGeometry? margin;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    this.gradient = AppColors.BUTTON_GRADIENT,
    this.fixedSize,
    this.margin,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(3);
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 19.w),
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          fixedSize: fixedSize ?? Size(263.w, 50.h),
          splashFactory: NoSplash.splashFactory,
        ),
        child: child,
      ),
    );
  }
}
