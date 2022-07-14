
import 'package:apmatik_app/app/ui/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPageTitle extends StatelessWidget {
  const CustomPageTitle({
    Key? key,
    required this.appTextStyle,
    required this.titleText,
  }) : super(key: key);

  final AppTextStyle appTextStyle;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 23.0.w),
      child: Text(
       titleText,
        style: appTextStyle.getSfProDisplayBold(Colors.black),
      ),
    );
  }
}