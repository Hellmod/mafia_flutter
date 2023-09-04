import 'package:flutter/material.dart';

class AppTextStyles {
  static const amountInCard = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const text16_500 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const text16_600 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const goldGradient = LinearGradient(
    colors: [Color(0xFFFFB445), Color(0xFFD85C30)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const grayGradient = LinearGradient(
    colors: [Color(0x61343F00), Color(0xFF161A22)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static TextStyle textInter(
      {double fontSize = 16, FontWeight fontWeight = FontWeight.w600}) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: Colors.white,
    );
  }

  //static mainColor Color(0xff1e1e1e);
}
