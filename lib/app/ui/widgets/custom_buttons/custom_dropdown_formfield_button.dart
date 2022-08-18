import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownButtonFormField extends StatelessWidget {
  final bool isBordered;

  final Object? value;
  final List<DropdownMenuItem<Object>>? items;
  final String? Function(dynamic)? validator;
  final String? labelText;
  final EdgeInsetsGeometry? padding;
  final TextStyle? labelTextStyle;
  final InputBorder? border;
  final InputBorder? focusBorder;
  final InputBorder? enabledBorder;
  const CustomDropdownButtonFormField(
      {Key? key,
      this.value,
      this.items,
      this.validator,
      this.labelText,
      this.padding,
      this.isBordered = false,
      this.labelTextStyle,
      this.border,
      this.focusBorder,
      this.enabledBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      child: DropdownButtonFormField(
        isDense: true,
        isExpanded: true,
        icon: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Image.asset(AppAssets.dropdown_icon),
        ),
        style: AppTextStyle().getSfProDisplayRegular_H5(AppColors.BLACK),
        decoration: isBordered
            ? InputDecoration(
                filled: true,
                fillColor: AppColors.WHITE,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.WHITE_GREY, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.WHITE_GREY, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.ORANGE, width: 1.0),
                ),
              )
            : InputDecoration(
                labelText: labelText ?? '',
                labelStyle: labelTextStyle ??
                    AppTextStyle()
                        .getSfProDisplayRegular_H5(AppColors.GREY_OPACITY),
                border: border ??
                    UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.GREY_OPACITY, width: 0.2),
                    ),
                focusedBorder: focusBorder ??
                    UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.GREY_OPACITY, width: 0.2),
                    ),
                enabledBorder: enabledBorder ??
                    UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.GREY_OPACITY, width: 0.2),
                    ),
              ),
        validator: validator,
        value: value,
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