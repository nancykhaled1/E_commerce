import 'dart:ui';

import 'package:flutter/material.dart';


class MyTheme {
  static const Color primaryColor = Color(0xFFE66F51);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static Color blackColor = Color(0xFF303030);
  static Color darkPrimaryColor = Color(0xFF06004F);



  static ThemeData LightMode = ThemeData(
    primaryColor: primaryColor,

      textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: blackColor,
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: blackColor,
          ),
          titleSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: blackColor,
          ))

  );
}