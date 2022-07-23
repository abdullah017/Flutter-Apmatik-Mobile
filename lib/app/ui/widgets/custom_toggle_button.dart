import 'package:apmatik_app/app/core/constant/color_constants.dart';
import 'package:flutter/material.dart';

class CustomToggleButton extends StatelessWidget {
  final String? firstText;
  final String? secondText;
  final String? thirdText;
 final List<bool> isSelected;
  final Function(int)? onPressed;

  const CustomToggleButton(
      {Key? key,
      this.firstText,
      this.secondText,
      this.thirdText,
      this.onPressed, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Container(
      width: 350,
      height: 35,
      color: AppColors.PAGEBACKGROUND,
      child: ToggleButtons(
        isSelected: isSelected,
        selectedColor: AppColors.WHITE,
        color: AppColors.ORANGE,
        fillColor: AppColors.ORANGE,
        renderBorder: true,
        //splashColor: Colors.red,
        highlightColor: Colors.orange,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(firstText ??'Ev Sahibi', style: TextStyle(fontSize: 12)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Text(secondText ??'Kiracı', style: TextStyle(fontSize: 12)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(thirdText??'Ev Sakini', style: TextStyle(fontSize: 12)),
          ),
        ],
        onPressed: onPressed
      ),
    );
  }
}
