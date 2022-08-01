import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCupertinoSwitch extends StatelessWidget {
  final bool value;
  final Function(bool)? onChanged;
  const CustomCupertinoSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color:
                  value ? CupertinoColors.activeOrange : CupertinoColors.black,
              width: 2),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: SizedBox(
        width: 33.w,
        height: 17.h,
        child: Transform.scale(
          transformHitTests: false,
          scale: .7.sm,
          child: CupertinoSwitch(
            value: value,
            trackColor: Colors.transparent,
            onChanged: onChanged,
            activeColor: Colors.transparent,
            thumbColor:
                value ? CupertinoColors.activeOrange : CupertinoColors.black,
          ),
        ),
      ),
    );
  }
}
