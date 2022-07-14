import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDropdownButtonFormField extends StatelessWidget {
  final Object? value;
  final List<DropdownMenuItem<Object>>? items;
  final String? Function(dynamic)? validator;
  final String? labelText;
  const CustomDropdownButtonFormField(
      {Key? key, this.value, this.items, this.validator, this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: labelText ?? 'gender'.tr,
          //border: new CustomBorderTextFieldSkin().getSkin(),
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