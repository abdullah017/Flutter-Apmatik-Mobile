import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final TextStyle? style;
  final bool? obscureText;
  final String labelText;
  final Widget? suffixIcon;
  final String? obscureCharacter;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextFormField(
      {Key? key,
      this.style,
      this.obscureText = false,
      required this.labelText,
      this.suffixIcon,
      this.obscureCharacter,
      this.padding,
      this.validator,
      this.textEditingController, this.inputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
      child: TextFormField(
        inputFormatters: inputFormatters,
        controller: textEditingController,
        style: style,
        obscureText: obscureText!,
        obscuringCharacter: obscureCharacter ?? '*',
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
