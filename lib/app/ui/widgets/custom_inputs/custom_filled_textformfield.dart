import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFilledTextFormField extends StatelessWidget {
  const CustomFilledTextFormField({
    Key? key,
    this.textEditingController,
    this.hint,
    this.validator,
  }) : super(key: key);
  final TextEditingController? textEditingController;
  final String? hint;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.guideLine9,
      child: SizedBox(
        width: 330.w,
        height: 30.h,
        child: TextFormField(
          validator: validator,
          cursorColor: AppColors.ORANGE,
          controller: textEditingController, //controller.phoneNumberController,
          style: AppTextStyle().getSfProDisplayRegular_H5(AppColors.BLACK),
          decoration: InputDecoration(
            hintText: hint ?? '',
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 5.0.h),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.WHITE_GREY, width: 1.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.WHITE_GREY, width: 1.0),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.ORANGE, width: 1.0),
            ),
          ),
        ),
      ),
    );
  }
}
