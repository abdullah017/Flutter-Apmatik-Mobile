// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
/////-----------------------[SF PRO DISPLAY FONT TYPE AREA!]------------------------------------/////

  /// [LIGHT_FONT_TYPE]

  TextStyle getSfProDisplayLight_H5(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 10.sp,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayLight_H6(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 9.sp,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        color: color);
  }

  /// [LIGHT_ITALIC_FONT_TYPE]
  TextStyle getSfProDisplayLight_Italic_H6(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 12.sp,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.italic,
        color: color);
  }

  ///[REGULAR_FONT_TYPE]

  TextStyle getSfProDisplayRegular_H1(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 30.sp,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayRegular_H4(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayRegular_H5(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayRegular_H66(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayRegular_H6(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayRegular_H7(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 8.sp,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayRegular_Italic_H6(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        color: color);
  }

  TextStyle getSfProDisplayRegular_Other(Color color) {
    return TextStyle(
        height: 2,
        fontFamily: 'SF Pro Display',
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayRegular_H7_other(Color color) {
    return TextStyle(
        height: 1.2,
        fontFamily: 'SF Pro Display',
        fontSize: 8.sp,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: color);
  }

  /// [MEDIUM_FONT_TYPE]

  TextStyle getSfProDisplayMedium(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayMedium_H4(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayMedium_H5(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayMedium_H6(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayMedium_H6_other(Color color) {
    return TextStyle(
        height: 2,
        fontFamily: 'SF Pro Display',
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayMedium_little(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayMedium_Size8(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 8.sp,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: color);
  }

  /// [BOLD_FONT_TYPE]

  TextStyle getSfProDisplayBold(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 30.sp,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayBold_H5(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayBold_h6(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplayBold_h6_other(Color color) {
    return TextStyle(
        height: 1.5,
        fontFamily: 'SF Pro Display',
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle getSfProDisplaySemiBold_h6(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: color);
  }

/////-----------------------[SF PRO ROUNDED FONT TYPE AREA!]------------------------------------/////

  ///[BOLD_FONT_TYPE]

  TextStyle get_SfProRounded_SemiBold_h4(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Rounded',
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle get_SfProRounded_SemiBold_h5(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Rounded',
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle get_SfProRounded_SemiBold_h6(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Rounded',
        fontSize: 7.sp,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: color);
  }

  ///[MEDIUM_FONT_TYPE]
  TextStyle get_SfProRounded_Medium_H5(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Rounded',
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: color);
  }

  TextStyle get_SfProRounded_Medium_H6(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro Rounded',
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: color);
  }

/////-----------------------[SF PRO FONT TYPE AREA!]------------------------------------/////
  TextStyle get_SfPro_Medium_H6(Color color) {
    return TextStyle(
        fontFamily: 'SF Pro',
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: color);
  }
  /////-----------------------[CREDIT CARD FONT TYPE AREA!]------------------------------------/////

  /// [CREDITCARD_FONT_TYPE]
  TextStyle getCreditCardFont_Size16(Color color) {
    return TextStyle(
        fontFamily: 'CREDIT CARD',
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: color);
  }
}
