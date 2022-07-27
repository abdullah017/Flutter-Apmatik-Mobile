import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDropdownButtonFormField extends StatelessWidget {
  final Object? value;
  final List<DropdownMenuItem<Object>>? items;
  final String? Function(dynamic)? validator;
  final String? labelText;
  final EdgeInsetsGeometry? padding;
  const CustomDropdownButtonFormField(
      {Key? key,
      this.value,
      this.items,
      this.validator,
      this.labelText,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
      child: DropdownButtonFormField(
        style: AppTextStyle().getSfProDisplayMedium_H6(AppColors.BLACK),
        decoration: InputDecoration(
          labelText: labelText ?? 'gender'.tr,
          labelStyle:
              AppTextStyle().getSfProDisplayRegular_H6(AppColors.GREY_OPACITY),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.GREY_OPACITY, width: 0.2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.GREY_OPACITY, width: 0.2),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.GREY_OPACITY, width: 0.2),
          ),
        ),
        validator: validator,
        value: value,
        isExpanded: true,
        onChanged: (value) {
          print(value);
        },
        onSaved: (value) {},
        items: items,
      ),
    );
  }
}


// controller.listOfValue.map((String val) {
//         return DropdownMenuItem(
//           value: val,
//           child: Text(
//             val,
//             style: AppTextStyle().getSfProDisplayMedium(Colors.black),
//           ),
//         );
//       }).toList(),