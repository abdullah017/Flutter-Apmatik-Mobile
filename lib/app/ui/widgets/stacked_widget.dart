import 'package:apmatik_app/app/core/constant/color_constants.dart';
import 'package:apmatik_app/app/ui/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StackedWidgets extends StatelessWidget {
  
  final List<Widget> items;
  final TextDirection direction;
  final double size;
  final double xShift;
  final String label;

  const StackedWidgets({
    Key? key,
    required this.items,
    this.direction = TextDirection.ltr,
    this.size = 100,
    this.xShift = 20,
    this.label = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allItems = items
        .asMap()
        .map((index, item) {
          final left = size - xShift;

          final value = Container(
            width: size,
            height: size,
            child: item,
            margin: EdgeInsets.only(left: left * index),
          );

          return MapEntry(index, value);
        })
        .values
        .toList();

    return Row(children: [
      Stack(
        children: direction == TextDirection.ltr
            ? allItems.reversed.toList()
            : allItems,
      ),
      Padding(
        padding: EdgeInsets.only(left: 3.0.w),
        child: Text(label,
            style: AppTextStyle().getSfProDisplayLight_H6(AppColors.GREY)),
      ),
    ]);
  }
}
