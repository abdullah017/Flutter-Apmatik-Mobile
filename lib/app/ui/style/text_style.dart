import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  /// [LIGHT_FONT_TYPE]

  TextStyle getSfProDisplayLight_H6(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro',
        fontSize: 10.sp,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        color: color);
  }

  ///[REGULAR_FONT_TYPE]

  TextStyle getSfProDisplayRegular_H1(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro',
        fontSize: 30.sp,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayRegular_H5(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro',
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayRegular_H6(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro',
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: color);
  }

  /// [MEDIUM_FONT_TYPE]

  TextStyle getSfProDisplayMedium(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro',
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayMedium_H4(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro',
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayMedium_H5(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro',
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayMedium_H6(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro',
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayMedium_little(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro',
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: color);
  }

  /// [BOLD_FONT_TYPE]

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
