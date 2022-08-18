import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPageTitle extends StatelessWidget {
  const CustomPageTitle({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0.w),
      child: Text(
        titleText,
        style: AppTextStyle().getSfProDisplayRegular_H1(Colors.black),
      ),
    );
  }
}
