
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
    colors:  [Color(0xFFFFB445), Color(0xFFD85C30)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

}
