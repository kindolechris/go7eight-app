import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColor {
  static const Color primaryColor = Color(0xFF1868CC);
  static const Color text3Color = Color(0xFFC442D9);
  static const Color supportColor = Color(0xFFE22B2B);
  static const Color transparentColor = Colors.transparent;

  static const dark = AppColorScheme(
    secondaryColor: Color(0xFFE7E7E7),
    backgroundColor: Color(0xFF0D0D0D),
    cardBackgroundColor: Color(0xFF161616),
    text1Color: Color(0xFF6C6C6C),
    text2Color: Color(0xFF949494),
    borderColor: Color(0xFF262626),
    lineColor: Color(0xFF424242),
    chatColor: Color(0xFF1B1B1B),
    containerColor: Color(0xFFD9D9D9),
    container2Color: Color(0xFFD2A417),
  );

  static const light = AppColorScheme(
    secondaryColor: Color(0xFF1A1A1A),
    backgroundColor: Color(0xFFFFFFFF),
    cardBackgroundColor: Color(0xFFF5F5F5),
    text1Color: Color(0xFF4D4D4D),
    text2Color: Color(0xFF6C6C6C),
    borderColor: Color(0xFFE0E0E0),
    lineColor: Color(0xFFBDBDBD),
    chatColor: Color(0xFFF0F0F0),
    containerColor: Color(0xFFF6F6F6),
    container2Color: Color(0xFFF4D03F),
  );
}

class AppColorScheme {
  final Color secondaryColor;
  final Color backgroundColor;
  final Color cardBackgroundColor;
  final Color text1Color;
  final Color text2Color;
  final Color borderColor;
  final Color lineColor;
  final Color chatColor;
  final Color containerColor;
  final Color container2Color;

  const AppColorScheme({
    required this.secondaryColor,
    required this.backgroundColor,
    required this.cardBackgroundColor,
    required this.text1Color,
    required this.text2Color,
    required this.borderColor,
    required this.lineColor,
    required this.chatColor,
    required this.containerColor,
    required this.container2Color,
  });
}


