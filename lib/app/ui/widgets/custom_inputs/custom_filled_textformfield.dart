import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFilledTextFormField extends StatelessWidget {
  const CustomFilledTextFormField({
    Key? key,
    this.textEditingController,
    this.hint,
    this.validator,
    this.contentPadding,
    this.keyboardType,
    this.style,
    this.width,
    this.height,
    this.inputFormatters,
    this.suffix,
    this.onChanged,
  }) : super(key: key);
  final TextEditingController? textEditingController;
  final String? hint;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final double? width;
  final double? height;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.guideLine,
      child: SizedBox(
        //width: width ?? 330.w,
        //height: height ?? 50.h,
        child: TextFormField(
          validator: validator,
          cursorColor: AppColors.ORANGE,
          controller: textEditingController, //controller.phoneNumberController,
          style: style ??
              AppTextStyle().getSfProDisplayRegular_H5(AppColors.BLACK),
          keyboardType: keyboardType ?? TextInputType.name,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint ?? '',
            filled: true,
            fillColor: Colors.white,
            //isDense: true,
            //errorStyle: const TextStyle(fontSize: 0.01),
            suffixIcon: Transform.translate(
                offset: const Offset(-10, 0), child: suffix),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 10,
              minHeight: 10,
            ),

            contentPadding: contentPadding ??
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
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.ORANGE, width: 1.0),
            ),
          ),
        ),
      ),
    );
  }
}
