import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUnderLineCheckBox extends StatelessWidget {
  const CustomUnderLineCheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.checkBoxText,
    required this.checkBoxInfoText,
  }) : super(key: key);

  final bool value;
  final dynamic Function(bool?)? onChanged;
  final String checkBoxText;
  final String checkBoxInfoText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: CheckboxListTile(
                contentPadding: EdgeInsets.only(right: 1),
                side: BorderSide(),
                // fillColor: MaterialStateProperty.all(Colors.orange),
                tristate: true,
                value: value, //controller.isCheck.value,
                onChanged: onChanged,
                activeColor: AppColors.ORANGE,
              ),
            ),
            buildCheckboxText(),
          ],
        ),
        buildUnderLine(),
        buildInfoText()
      ],
    );
  }

  Expanded buildCheckboxText() {
    return Expanded(
        flex: 6,
        child: Text(
          checkBoxText,
          style: AppTextStyle().getSfProDisplayMedium_H6(AppColors.BLACK),
        ));
  }

  Padding buildUnderLine() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Divider(
        color: AppColors.GREY_OPACITY,
        height: 1.h,
      ),
    );
  }

  Padding buildInfoText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 1.h),
      child: Text(checkBoxInfoText,
          textAlign: TextAlign.start,
          style: AppTextStyle().getSfProDisplayLight_H6(Colors.grey)),
    );
  }
}
