import 'package:flutter/material.dart';

class CustomDecoration {

  static  BoxDecoration defaultShadow = BoxDecoration(

      boxShadow: const [  BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), blurRadius: 1, spreadRadius: 0, offset: Offset(0.0, 0.0) ) ],
      borderRadius: BorderRadius.circular(3.0),
      color: Colors.white
  );


}