import 'package:flutter/material.dart';

class AppColors {
  static const int _primaryValue =  0xFFF03A55;
  static const int _mySecondaryValue = 0xFFF57988;

  static const MaterialColor primaryColor = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFFFE9EB),
      100: Color(0xFFFFB3BE),
      200: Color(0xFFFF808E),
      300: Color(0xFFFF4D5E),
      400: Color(0xFFFF263F),
      500: Color(_primaryValue),
      600: Color(0xFFC8002D),
      700: Color(0xFFB20029),
      800: Color(0xFF990024),
      900: Color(0xFF7D001C),
    },
  );


  static const MaterialColor secondaryColor = MaterialColor(
    _mySecondaryValue,
    <int, Color>{
      50: Color(0xFFFFEEF1),
      100: Color(0xFFFFC3D0),
      200: Color(0xFFFF98AF),
      300: Color(0xFFFF6D8E),
      400: Color(0xFFFF4B75),
      500: Color(_mySecondaryValue),
      600: Color(0xFFE34F66),
      700: Color(0xFFD7495C),
      800: Color(0xFFCF4151),
      900: Color(0xFFC1303F),
    },
  );
}