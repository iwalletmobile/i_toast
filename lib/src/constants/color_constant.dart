import 'package:flutter/material.dart';

@immutable
class ColorConstants {
  const ColorConstants._();
  static const MaterialColor statesWarning = MaterialColor(
    0xFFFFF2EB,
    {
      100: Color(0xFFFFF2EB),
      200: Color(0xFFFFD6BF),
      300: Color(0xFFFE8139),
    },
  );

  static const MaterialColor statesError = MaterialColor(
    0xFFFFECEE,
    {
      100: Color(0xFFFFECEE),
      200: Color(0xFFFFC2C9),
      300: Color(0xFFFF445A),
    },
  );

  static const MaterialColor statesInfo = MaterialColor(
    0xFFEBF5FF,
    {
      100: Color(0xFFEBF5FF),
      200: Color(0xFFBFE0FF),
      300: Color(0xFF3AA1FF),
    },
  );

  static const MaterialColor statesSuccess = MaterialColor(
    0xFFF7FFFA,
    {
      100: Color(0xFFF7FFFA),
      200: Color(0xFFF0FFF5),
      300: Color(0xff8CFFB3),
    },
  );
}
