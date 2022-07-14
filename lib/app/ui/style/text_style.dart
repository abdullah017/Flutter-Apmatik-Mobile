import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  TextStyle getSfProDisplayLittle(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro',
        fontSize: 10.sp,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayRegular(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro',
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayRegular_h6(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro',
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayMedium(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro',
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayBold(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro',
        fontSize: 30.sp,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayBold_h6(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro',
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: color);
  }
}
