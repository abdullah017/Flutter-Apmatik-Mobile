import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? padding;

  final bool? obscureText;
  final String labelText;
  final Widget? suffixIcon;
  final String? obscureCharacter;
  final TextInputType? keybordType;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextFormField({
    Key? key,
    this.obscureText = false,
    required this.labelText,
    this.suffixIcon,
    this.obscureCharacter,
    this.padding,
    this.validator,
    this.textEditingController,
    this.inputFormatters,
    this.keybordType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      child: TextFormField(
        enableSuggestions: false,
        autocorrect: false,
        cursorColor: AppColors.ORANGE,
        keyboardType: keybordType,
        inputFormatters: inputFormatters,
        controller: textEditingController,
        style: AppTextStyle().getSfProDisplayMedium_H6(AppColors.BLACK),
        obscureText: obscureText!,
        obscuringCharacter: obscureCharacter ?? '*',
        validator: validator,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffE6E6E6)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.ORANGE),
          ),
          labelText: labelText,
          labelStyle:
              AppTextStyle().getSfProDisplayRegular_H5(AppColors.GREY_OPACITY),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
