// ignore_for_file: sort_child_properties_last

import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomToggleButton extends StatelessWidget {
  final String? firstText;
  final String? secondText;
  final String? thirdText;
  final List<bool> isSelected;
  final Function(int)? onPressed;
  final List<Widget>? newChildren;

  const CustomToggleButton(
      {Key? key,
      this.firstText,
      this.secondText,
      this.thirdText,
      this.onPressed,
      required this.isSelected, this.newChildren})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 30.h,
      color: AppColors.PAGEBACKGROUND,
      child: ToggleButtons(
          isSelected: isSelected,
          selectedColor: AppColors.WHITE,
          color: AppColors.ORANGE,
          fillColor: AppColors.ORANGE,
          renderBorder: true,
          borderColor: AppColors.ORANGE,
          borderWidth: 0,
          //splashColor: Colors.red,
          highlightColor: Colors.orange,
          children: newChildren ?? <Widget>  [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(firstText ?? 'home_owner'.tr,
                  style: const TextStyle(fontSize: 12)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(secondText ?? 'tenant'.tr,
                  style: const TextStyle(fontSize: 12)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(thirdText ?? 'resident'.tr,
                  style: const TextStyle(fontSize: 12)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(thirdText ?? 'resident'.tr,
                  style: const TextStyle(fontSize: 12)),
            ),
          ],
          onPressed: onPressed),
    );
  }
}
