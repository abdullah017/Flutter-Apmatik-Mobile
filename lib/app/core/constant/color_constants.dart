import 'package:flutter/material.dart';

class AppColors {
  static const Color PAGEBACKGROUND = Color(0xffF7FBFA);
  static const Color WHITE = Colors.white;
  static const Color ORANGE = Color(0xffF8941C);
  static const Color BLACK = Color(0xff000000);
    static const Color GREY = Colors.grey;
  static const Color DARK_GREY = Color(0xff525252);
  static const Color WHITE_OPACITY = Color(0xffF7FBFA);
  static const Color GREY_OPACITY = Color.fromRGBO(0, 0, 0, 0.3);

  static const LinearGradient BUTTON_GRADIENT = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Color(0xffD27913),
      ORANGE,
    ],
    stops: [0, 0.9],
  );
}
