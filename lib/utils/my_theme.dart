import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {
  static const Color primaryColor = Color(0xFF004182);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static Color blackColor = Color(0xFF303030);



  static ThemeData LightMode = ThemeData(
    primaryColor: primaryColor,

      textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: whiteColor,
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: whiteColor,
          ),
          titleSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: whiteColor,
          ))

  );
}